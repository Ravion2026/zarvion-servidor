FROM ubuntu:latest

# Instalar curl y dependencias de compatibilidad de Godot
RUN apt-get update && apt-get install -y \
    curl \
    libglib2.0-0 \
    libgandalf-1-0 \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Descargar el binario del servidor desde GitHub Releases
RUN curl -L -o /app/servidor.x86_64 "https://github.com/Ravion2026/zarvion-servidor/releases/download/v1.0/servidor.x86_64"

# Dar permisos de ejecución
RUN chmod +x /app/servidor.x86_64

EXPOSE 8910

CMD ["/app/servidor.x86_64", "--headless"]
