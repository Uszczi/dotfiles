#!/bin/bash

# Ustawienia
work_time=25   # czas pracy w minutach
break_time=5   # czas przerwy w minutach

function countdown() {
    local minutes=$1
    local seconds=$((minutes * 60))

    while [ $seconds -gt 0 ]; do
        printf "\rPozostało: %02d:%02d" $((seconds / 60)) $((seconds % 60))
        sleep 1
        ((seconds--))
    done
    echo ""
}

while true; do
    echo "⏳ Czas pracy ($work_time minut)..."
    countdown $work_time
    echo -e "\a✅ Koniec pracy! Czas na przerwę ($break_time minut)!"
    sleep 1

    countdown $break_time
    echo -e "\a🔁 Przerwa skończona! Wracamy do pracy."
    sleep 1
done
