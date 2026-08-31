#!/bin/bash

# Noms des périphériques audio
SINK_1="alsa_output.pci-0000_01_00.1.hdmi-stereo"  # Remplacez par le nom de votre premier périphérique
SINK_2="alsa_output.pci-0000_00_1f.3.analog-stereo"  # Remplacez par le nom de votre deuxième périphérique

# Récupère le périphérique actuel
CURRENT_SINK=$(pactl get-default-sink)

# Bascule vers l'autre périphérique
if [ "$CURRENT_SINK" = "$SINK_1" ]; then
    pactl set-default-sink "$SINK_2"
elif [ "$CURRENT_SINK" = "$SINK_2" ]; then
    pactl set-default-sink "$SINK_1"
else
    echo "Périphérique actuel non reconnu : $CURRENT_SINK"
fi
