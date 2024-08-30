FROM maven:3.8.6-alpine as builder

WORKDIR /usr/src/app

COPY pom.xml .
COPY src src

RUN mvn clean package

FROM eclipse-temurin:17-jdk-alpine

COPY --from=builder /usr/src/app/target/app.jar /usr/src/app/app.jar

WORKDIR /usr/src/app

CMD ["java", "-jar", "app.jar"]

