#!/bin/bash

# Ruta al archivo de versión local
ARCHIVO_VERSION_LOCAL="/opt/wst-version.log"

# Establecer la variable DISPLAY manualmente
export DISPLAY=:0

# URL del archivo de versión remota
URL_VERSION_REMOTA=$1

# Leer la versión local
VERSION_LOCAL=$(cat $ARCHIVO_VERSION_LOCAL)

# Obtener la versión remota
VERSION_REMOTA=$(curl -s $URL_VERSION_REMOTA)

# Obtener el PID del proceso de sesión del usuario
PID=$(pgrep -u $(whoami) gnome-session | head -n 1)

# Obtener el DISPLAY del entorno del usuario a través de dbus
DISPLAY=$(sudo -u $(whoami) dbus-launch --exit-with-session env | grep -E '^DISPLAY=' | cut -d'=' -f2-)

# Comparar versiones
if [ "$VERSION_LOCAL" != "$VERSION_REMOTA" ]; then
    # Mostrar una alerta si las versiones no coinciden
    /usr/bin/zenity --warning --text="Su PC está desactualizada. Por favor, contacte al administrador del sistema." --title="Advertencia de Actualización"
fi