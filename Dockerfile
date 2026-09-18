FROM alpine:latest


# Instalar dependencias esenciales para que Godot corra en modo consola (headless)

RUN apk add --no-cache libgcc libstdc++ glib



# Copiar todos los archivos del servidor a la carpeta /app del contenedor

COPY . /app

WORKDIR /app



# Dar permisos de ejecución al binario de Linux que exportaste

RUN chmod +x servidor.x86_64



# Exponer el puerto ENet que utiliza tu proyecto

EXPOSE 8910



# Ejecutar el servidor en modo headless

CMD ["./servidor.x86_64", "--headless"]