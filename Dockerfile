FROM ubuntu:latest

# Instalar curl, dependencias y soporte de fuentes para Godot
RUN apt-get update && apt-get install -y \
    curl \
    libglib2.0-0 \
    libstdc++6 \
    libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Descargar el binario del servidor desde GitHub Releases
RUN curl -L -o /app/servidor.x86_64 "https://github.com/Ravion2026/zarvion-servidor/releases/download/v1.0/servidor.x86_64"

# Dar permisos de ejecución al binario
RUN chmod +x /app/servidor.x86_64

# Copiar el archivo .pck desde tu repositorio al contenedor
COPY servidor.pck /app/servidor.pck

EXPOSE 8910

# Iniciar el servidor Godot en modo headless
CMD ["/app/servidor.x86_64", "--headless"]
