# --- Etapa 1: La Construcción (El Taller ) ---
# Aquí es donde compilamos nuestro código Java en un archivo .jar.
# Usamos una imagen base que ya tiene Java 17 y herramientas de compilación.
FROM eclipse-temurin:17-jdk-jammy AS build

# Establecemos el directorio de trabajo dentro del contenedor.
WORKDIR /workspace/app

# Copiamos solo los archivos de Maven para descargar las dependencias primero.
# Esto es un truco de caché: si las dependencias no cambian, Docker no las vuelve a descargar.
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN ./mvnw dependency:go-offline

# Ahora copiamos el resto del código fuente.
COPY src src

# Compilamos la aplicación y creamos el archivo .jar.
# -DskipTests omite la ejecución de pruebas para acelerar la construcción.
RUN ./mvnw package -DskipTests


# --- Etapa 2: La Ejecución (El Escenario 🚀) ---
# Aquí es donde ejecutamos la aplicación ya compilada.
# Usamos una imagen mucho más ligera que solo tiene lo necesario para ejecutar Java.
FROM eclipse-temurin:17-jre-jammy
WORKDIR /workspace/app

# Copiamos únicamente el archivo .jar que se creó en la etapa de construcción.
COPY --from=build /workspace/app/target/*.jar app.jar

# Le decimos a Docker que nuestra aplicación escuchará en el puerto 8080.
EXPOSE 8080

# Este es el comando final que se ejecuta para iniciar la aplicación.
# Cambia la última línea por esta:
ENTRYPOINT ["sh", "-c", "java -jar app.jar --server.port=${PORT:-8080}"]