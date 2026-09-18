FROM alpine:latest

# Instalar dependencias esenciales y curl para descargar el binario
RUN apk add --no-cache libgcc libstdc++ glib curl

WORKDIR /app

# Descargar el servidor pesado directamente desde la versión de GitHub
RUN curl -L -o servidor.x86_64 "https://github.com/Ravion2026/zarvion-servidor/releases/download/v1.0/servidor.x86_64"

# Dar permisos de ejecución al binario descargado
RUN chmod +x servidor.x86_64

# Exponer el puerto ENet de Godot
EXPOSE 8910

# Iniciar el servidor en modo headless
CMD ["./servidor.x86_64", "--headless"]
