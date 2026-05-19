#!/bin/bash

# Dette skriptet kjører både Flatpack og DNF update. Bør fungere på alle Fedora-baserte distroer.
# Husk å gjør skriptet kjørbart etter nedlasting: chmod +x ./update.sh

# Jeg har satt opp dette skriptet som en knapp på Stream Deck med OpenDeck og "Run Command":
# KDE Plasma: konsole -e ./update.sh
# GNOME: terminal -e ./update.sh

# Oppdater Flatpak-pakker
echo "Oppdaterer Flatpak-pakker først hvis det finnes noen oppdateringer."
flatpak update

# Be om bekreftelse før DNF-oppdatering
echo -e "\nNå skal vi oppdatere med Dandified YUM. Det kan hende du må skrive inn passordet ditt."
read -p "Trykk [Enter] for å fortsette..."

# Oppdater med DNF
echo -e "\nOppdaterer systemet med DNF."
sudo dnf update

# Fullført melding
echo -e "\nNå er Fedora  oppdatert og du kan fortsette dagen din."
read -p "Trykk [Enter] for å avslutte..."
