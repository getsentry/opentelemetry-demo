# Deploying OpenTelemetry Demo

This folder contains additional configuration for deploying the OpenTelemetry Shop Demo on Sentry's infrastructure. We're using [the official OpenTelemetry Helm chart](https://github.com/open-telemetry/opentelemetry-helm-charts/tree/main/charts/opentelemetry-demo) to deploy the demo on our Kubernetes cluster.

The demo will be deployed here: https://otel-demo.testa.getsentry.net/ (internal only at the moment)

## Configuration Files

You can edit the following files in this directory:

* `sentry-components.yaml` -- a list of components that have Sentry instrumentation. If some service there is commented out, that means that the vanilla version of the service (meaning, a prebuilt Docker image) will be started. Here you can also specify additional environment variables that will be passed to the running service.
* `global.yaml` -- overrides for the Helm chart that is used to deploy the demo (https://github.com/open-telemetry/opentelemetry-helm-charts/tree/main/charts/opentelemetry-demo). Here you can configure things like allocated CPU/memory for each service.
