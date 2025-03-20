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

# Skopiuj skrypt startowy do kontenera
COPY start.sh /start.sh

# Nadaj prawa do wykonania skryptowi
RUN chmod +x /start.sh

# Ustaw port, na którym aplikacja będzie nasłuchiwać
EXPOSE 8080

# Uruchom aplikację poprzez skrypt
CMD ["/start.sh"]
