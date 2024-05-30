#!/bin/bash

# Ruta al archivo de versión local
ARCHIVO_VERSION_LOCAL="/opt/wst-version.log"

# URL del archivo de versión remota
URL_VERSION_REMOTA=$1

# Leer la versión local
VERSION_LOCAL=$(cat $ARCHIVO_VERSION_LOCAL)

# Obtener la versión remota
VERSION_REMOTA=$(curl -s $URL_VERSION_REMOTA)

# Comparar versiones
if [ "$VERSION_LOCAL" != "$VERSION_REMOTA" ]; then
    # Mostrar una alerta si las versiones no coinciden
    /usr/bin/zenity --warning --no-wrap --title "Advertencia de Actualización" --text "Su PC está desactualizada. Por favor, contacte al administrador del sistema.\nATUSU: 1179" 2> /dev/null
fi