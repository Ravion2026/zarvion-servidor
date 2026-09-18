FROM alpine:latest

RUN apk add --no-cache libgcc libstdc++ glib curl

WORKDIR /app

# Descargar el binario y guardarlo explícitamente como servidor.x86_64
RUN curl -L -o /app/servidor.x86_64 "https://github.com/Ravion2026/zarvion-servidor/releases/download/v1.0/servidor.x86_64"

RUN chmod +x /app/servidor.x86_64

EXPOSE 8910

CMD ["/app/servidor.x86_64", "--headless"]
