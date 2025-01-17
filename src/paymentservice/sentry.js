const Sentry = require("@sentry/node");
// require("@sentry/tracing");
// const { ProfilingIntegration } = require("@sentry/profiling-node");

function initSentry() {
  // Make sure to call `Sentry.init` BEFORE initializing the OpenTelemetry SDK
  Sentry.init({
    dsn: process.env.SENTRY_DSN,
    tracesSampleRate: 1.0,
    // profilesSampleRate: 1.0,
    // set the instrumenter to use OpenTelemetry instead of Sentry
    instrumenter: "otel",
    includeLocalVariables: true,
    // integrations: [new ProfilingIntegration()],
    // ...
  });
}

module.exports = {
  initSentry,
};
