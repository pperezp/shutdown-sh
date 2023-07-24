#!/bin/bash

read -p "Ingrese la cantidad de minutos después de los cuales se apagará el computador: " minutos

# Validar si la entrada es un número entero positivo
if [[ $minutos =~ ^[0-9]+$ && $minutos -gt 0 ]]; then
  # Calcular el tiempo en segundos
  segundos=$((minutos * 60))

  echo "El computador se apagará en $minutos minutos."
  echo "Para cancelar el apagado, ejecute 'sudo shutdown -c' en otra terminal."
  echo "¡Asegúrese de guardar su trabajo antes de que se apague!"

  # Temporizador
  for ((i = segundos; i >= 0; i--)); do
    printf "\rTiempo restante: %02d:%02d" $((i / 60)) $((i % 60))
    sleep 1
  done

  # Apagar el computador
  sudo shutdown -h now
else
  echo "Entrada inválida. Por favor, ingrese un número entero positivo."
fi
