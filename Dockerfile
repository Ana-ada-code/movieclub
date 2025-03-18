FROM openjdk:21-slim-bookworm
EXPOSE 8080
COPY target/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
