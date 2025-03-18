# Użycie obrazu Javy
FROM eclipse-temurin:17-jdk AS builder

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików projektu
COPY . .

# Budowanie aplikacji (generuje plik JAR w katalogu target/)
RUN ./mvnw clean package -DskipTests

# -----------------------------------------
# Drugi etap: uruchamianie aplikacji
# -----------------------------------------
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Kopiowanie zbudowanego pliku JAR z poprzedniego etapu
COPY --from=builder /app/target/*.jar app.jar

# Uruchamianie aplikacji
CMD ["java", "-jar", "app.jar"]
