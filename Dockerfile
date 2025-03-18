# Wybierz obraz Javy
FROM openjdk:17-jdk-slim

# Skopiuj pliki projektu do kontenera
COPY . /app

# Przejdź do katalogu aplikacji
WORKDIR /app

# Zainstaluj Maven, jeśli nie jest obecny
RUN apt-get update && apt-get install -y maven

# Zbuduj aplikację
RUN mvn clean package -DskipTests

# Ustaw port, na którym aplikacja będzie nasłuchiwać
EXPOSE 8080

# Uruchom aplikację
CMD ["java", "-jar", "target/movieclub-0.0.1-SNAPSHOT.jar"]
