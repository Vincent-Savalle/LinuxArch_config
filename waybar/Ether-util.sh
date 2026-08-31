#!/usr/bin/env bash
echo "Script lancé" >> /tmp/waybar_debug.log

iface="enp4s0" 

RX1=$(cat /sys/class/net/$iface/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$iface/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/$iface/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$iface/statistics/tx_bytes)

# calcul du débit en Ko/s
RX_RATE=$(( (RX2 - RX1) / 1024 ))
TX_RATE=$(( (TX2 - TX1) / 1024 ))

echo "↓ ${RX_RATE}KB/s ↑ ${TX_RATE}KB/s"

