FROM maven:3.8.6-jdk-11 AS appServerBuild
WORKDIR /usr/src/eureka-server
COPY . .
RUN mvn package -DskipTests

FROM openjdk:11-jre-slim AS appServerRuntime
WORKDIR /app
COPY --from=appServerBuild /usr/src/eureka-server/target/eureka-server.jar ./
EXPOSE 8080
CMD ["java", "-jar", "eureka-server.jar"]