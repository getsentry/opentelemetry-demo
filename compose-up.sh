#!/usr/bin/env bash
set -euxo pipefail

# Change to the script directory
cd "$(dirname "$(realpath "$0")")"

# Merge env files
cat .env .env.sentry > .env.merged

docker-compose --env-file .env.merged up "$@"
