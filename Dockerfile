FROM openjdk:8-jre
EXPOSE 8080
ADD target/library.jar library.jar
ENTRYPOINT ["java", "-jar", "/library.jar"]