# Copyright The OpenTelemetry Authors
# SPDX-License-Identifier: Apache-2.0

require "ostruct"
require "pony"

require "sentry-ruby"
require "sentry-opentelemetry"

require "opentelemetry/sdk"
require "opentelemetry/exporter/otlp"
require "opentelemetry/instrumentation/sinatra"


Sentry.init do |config|
  config.traces_sample_rate = 1.0
  config.instrumenter = :otel
  config.capture_exception_frame_locals = true
end

# sinatra needs to be required after Sentry.init because of at_exit monkey business
require "sinatra"

use Sentry::Rack::CaptureExceptions
set :port, ENV["EMAIL_SERVICE_PORT"]

OpenTelemetry::SDK.configure do |c|
  c.use "OpenTelemetry::Instrumentation::Sinatra"
  c.add_span_processor(Sentry::OpenTelemetry::SpanProcessor.instance)
end

OpenTelemetry.propagation = Sentry::OpenTelemetry::Propagator.new

post "/send_order_confirmation" do
  data = JSON.parse(request.body.read, object_class: OpenStruct)

  # get the current auto-instrumented span
  current_span = OpenTelemetry::Trace.current_span
  current_span.add_attributes({
    "app.order.id" => data.order.order_id,
  })

  send_email(data)

end

error do
  OpenTelemetry::Trace.current_span.record_exception(env['sinatra.error'])
end

def send_email(data)
  # create and start a manual span
  tracer = OpenTelemetry.tracer_provider.tracer('emailservice')
  tracer.in_span("send_email") do |span|
    Pony.mail(
      to:       data.email,
      from:     "noreply@example.com",
      subject:  "Your confirmation email",
      body:     erb(:confirmation, locals: { order: data.order }),
      via:      :test
    )
    span.set_attribute("app.email.recipient", data.email)
    puts "Order confirmation email sent to: #{data.email}"
  end
  # manually created spans need to be ended
  # in Ruby, the method `in_span` ends it automatically
  # check out the OpenTelemetry Ruby docs at: 
  # https://opentelemetry.io/docs/instrumentation/ruby/manual/#creating-new-spans 
end
