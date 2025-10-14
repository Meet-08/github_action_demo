FROM gradle:9.0-alpine as build
WORKDIR /app

COPY gradle gradle
COPY gradlew .
COPY build.gradle settings.gradle gradle.properties ./
COPY settings.gradle ./

RUN ./gradlew --no-daemon help || true

COPY . .

RUN ./gradlew --no-daemon clean bootJar -x test
