# Copyright The OpenTelemetry Authors
# SPDX-License-Identifier: Apache-2.0


FROM eclipse-temurin:17-jdk AS builder

WORKDIR /usr/src/app/

COPY ./src/adservice/gradlew* ./src/adservice/settings.gradle* ./src/adservice/build.gradle .
COPY ./src/adservice/gradle ./gradle

RUN ./gradlew
RUN ./gradlew downloadRepos

COPY ./src/adservice/ ./
COPY ./pb/ ./proto
RUN ./gradlew installDist -PprotoSourceDir=./proto

# -----------------------------------------------------------------------------

FROM eclipse-temurin:17-jre

ARG version=1.24.0
WORKDIR /usr/src/app/

COPY --from=builder /usr/src/app/ ./

ADD https://search.maven.org/remotecontent?filepath=io/sentry/sentry-opentelemetry-agent/6.13.0/sentry-opentelemetry-agent-6.13.0.jar /app/opentelemetry-javaagent.jar
# RUN chmod 644 /app/opentelemetry-javaagent.jar
ENV JAVA_TOOL_OPTIONS=-javaagent:/app/opentelemetry-javaagent.jar
ENV SENTRY_AUTO_INIT=false

EXPOSE ${AD_SERVICE_PORT}
ENTRYPOINT [ "./build/install/opentelemetry-demo-ad-service/bin/AdService" ]
