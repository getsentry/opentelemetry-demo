# Copyright The OpenTelemetry Authors
# SPDX-License-Identifier: Apache-2.0


FROM gradle:7-jdk17 AS builder

WORKDIR /usr/src/app/

COPY ./src/frauddetectionservice/ ./
COPY ./pb/ ./src/main/proto/
RUN gradle shadowJar

# -----------------------------------------------------------------------------

FROM gcr.io/distroless/java17-debian11

ARG version=1.23.0
WORKDIR /usr/src/app/

COPY --from=builder /usr/src/app/build/libs/frauddetectionservice-1.0-all.jar ./
ADD https://search.maven.org/remotecontent?filepath=io/sentry/sentry-opentelemetry-agent/6.13.0/sentry-opentelemetry-agent-6.13.0.jar /app/opentelemetry-javaagent.jar
# RUN chmod 644 /app/opentelemetry-javaagent.jar
ENV JAVA_TOOL_OPTIONS=-javaagent:/app/opentelemetry-javaagent.jar
ENV SENTRY_AUTO_INIT=false

ENTRYPOINT [ "java", "-jar", "frauddetectionservice-1.0-all.jar" ]
