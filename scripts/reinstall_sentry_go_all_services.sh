#!/usr/bin/env bash
### This script installs the provided version of "sentry-go" library to all
### Go-based services (version "master" is used by default).
set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
unset GOROOT

VERSION="${1:-master}"

SERVICES="checkoutservice productcatalogservice accountingservice"

for s in $SERVICES; do
  cd $SCRIPT_DIR/../src/$s
  go get github.com/getsentry/sentry-go@$VERSION
  go get github.com/getsentry/sentry-go/otel@$VERSION
  go mod tidy
done
