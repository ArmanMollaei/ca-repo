# Stage 1: Build
FROM openjdk:17-slim as builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# Stage 2: Runtime
FROM openjdk:17-slim
WORKDIR /app
COPY --from=builder /app/target/react-and-spring-data-rest-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
