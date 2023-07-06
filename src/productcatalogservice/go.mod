module github.com/opentelemetry/opentelemetry-demo/src/productcatalogservice

go 1.19

require (
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/sirupsen/logrus v1.9.0
	golang.org/x/net v0.8.0 // indirect
	google.golang.org/grpc v1.51.0
)

require (
	github.com/getsentry/sentry-go v0.22.1-0.20230706083219-bcd29eb92ad9
	github.com/getsentry/sentry-go/otel v0.22.1-0.20230706083219-bcd29eb92ad9
	go.opentelemetry.io/contrib/instrumentation/runtime v0.37.0
	go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc v0.34.0
	go.opentelemetry.io/otel/metric v0.34.0
	go.opentelemetry.io/otel/sdk v1.11.2
	go.opentelemetry.io/otel/sdk/metric v0.34.0
	go.opentelemetry.io/otel/trace v1.11.2
	google.golang.org/protobuf v1.29.1
)

require (
	github.com/cenkalti/backoff/v4 v4.2.0 // indirect
	github.com/go-logr/logr v1.2.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.7.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/internal/retry v1.11.2 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlpmetric v0.34.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.11.2 // indirect
	go.opentelemetry.io/proto/otlp v0.19.0 // indirect
)

require (
	go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.37.0
	go.opentelemetry.io/otel v1.11.2
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.4.1
	golang.org/x/sys v0.6.0 // indirect
	golang.org/x/text v0.8.0 // indirect
	google.golang.org/genproto v0.0.0-20220126215142-9970aeb2e350 // indirect
)
