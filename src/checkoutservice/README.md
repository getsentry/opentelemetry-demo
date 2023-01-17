# Checkout Service

This service provides checkout services for the application.

## Local Build

To build the protos and the service binary, run:

```sh
# src/
protoc -I ../../pb/ ../../pb/demo.proto --go_out=./ --go-grpc_out=./
# src/checkoutservice
go build -o /go/bin/checkoutservice/ ./
```

## Docker Build

From the root directory, run:

```sh
docker compose build checkoutservice
```
