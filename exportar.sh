#!/bin/bash

RUTA="/home/david/Documentos/git/Personal/apps_script"
SALIDA="/home/david/Documentos/git/Personal/apps_script/proyecto.txt"

echo "📂 Leyendo desde: $RUTA"
echo "📝 Exportando a: $SALIDA"
echo "----------------------------------"

> "$SALIDA"

COUNT=0

while IFS= read -r archivo; do
    echo "########################################" >> "$SALIDA"
    echo "# ARCHIVO: $archivo" >> "$SALIDA"
    echo "########################################" >> "$SALIDA"
    echo "" >> "$SALIDA"
    cat "$archivo" >> "$SALIDA"
    echo -e "\n\n" >> "$SALIDA"
    COUNT=$((COUNT + 1))
done < <(find "$RUTA" -type f \( -name "*.js" -o -name "*.html" -o -name "*.css" \))

echo "✅ Archivos exportados: $COUNT"
