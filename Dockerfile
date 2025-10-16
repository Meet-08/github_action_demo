FROM gradle:8.0 AS build
WORKDIR /app

# copy gradle wrapper files early to use gradle cache/help if you want
COPY gradle gradle
COPY gradlew .

# copy the rest of the project (this may overwrite gradlew)
COPY . .

# ensure wrapper is executable after the final COPY
RUN chmod +x gradlew \
 && sed -i 's/\r$//' gradlew || true

# build
RUN ./gradlew --no-daemon clean bootJar -x test

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 80

ENTRYPOINT ["java", "-jar", "app.jar"]
