#!/bin/bash

BATTERY=/sys/class/power_supply/BAT0
CAPACITY=$(cat "$BATTERY/capacity")
STATUS=$(cat "$BATTERY/status")

if [[ "$STATUS" == "Discharging" && "$CAPACITY" -le 20 ]]; then
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus \
        notify-send -u critical "Battery Low" "${CAPACITY}% remaining — plug in your charger!"
fi
