#!/bin/bash

# Oppdater Flatpak-pakker
echo "Oppdaterer Flatpak-pakker først hvis det finnes noen oppdateringer."
flatpak update -y

# Be om bekreftelse før DNF-oppdatering
echo -e "\nNå skal vi oppdatere med Dandified YUM. Det kan hende du må skrive inn passordet ditt."
read -p "Trykk [Enter] for å fortsette..."

# Oppdater med DNF
echo -e "\nOppdaterer systemet med DNF."
sudo dnf update -y

# Fullført melding
echo -e "\nNå er Fedora  oppdatert og du kan fortsette dagen din."
read -p "Trykk [Enter] for å avslutte..."
