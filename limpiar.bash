#!/bin/bash

INPUT="ia_monitor_domains.txt"
OUTPUT_RESUELTOS="resueltos.txt"
OUTPUT_NO_RESUELTOS="no_resueltos.txt"

# Limpiar los archivos de salida anteriores
> "$OUTPUT_RESUELTOS"
> "$OUTPUT_NO_RESUELTOS"

# Leer cada dominio y probar su resolución
while read -r dominio; do
  # Ignorar líneas vacías
  if [ -z "$dominio" ]; then
    continue
  fi

  if nslookup "$dominio" >/dev/null 2>&1; then
    echo "$dominio" >> "$OUTPUT_RESUELTOS"
  else
    echo "$dominio" >> "$OUTPUT_NO_RESUELTOS"
  fi
done < "$INPUT"

echo "Dominios resolubles guardados en: $OUTPUT_RESUELTOS"
echo "Dominios no resolubles guardados en: $OUTPUT_NO_RESUELTOS"

