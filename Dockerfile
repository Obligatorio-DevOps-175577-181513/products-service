FROM maven:3.8.5-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/products-service-example-0.0.1-SNAPSHOT.jar /app/products-service-example.jar
CMD ["java", "-jar", "products-service-example.jar"]