FROM gradle:8.0 AS build
WORKDIR /app

COPY gradle gradle
COPY gradlew .

RUN ./gradlew --no-daemon help || true

COPY . .

RUN ./gradlew --no-daemon clean bootJar -x test

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 80

ENTRYPOINT ["java", "-jar", "app.jar"]
