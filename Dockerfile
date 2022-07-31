FROM adoptopenjdk:11-jre-hotspot
COPY "target/service-registry.jar" service-registry.jar
ENTRYPOINT ["java", "-jar", "service-registry.jar"]