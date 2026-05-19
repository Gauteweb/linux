#!/bin/bash

# Skript skrevet av: Gaute Holmin 19/5-2026.
# Dette skriptet vil installere alt du trenger for å komme gang med gaming på Fedora Linux (Workstation og KDE Plasma Desktop).
# For å kunne kjøre skriptet etter nedlasting må du åpne en terminal i mappen du har lastet ned skriptet og bruke kommandoene:
# chmod +x fedora_nvidia_gaming.sh
# ./fedora_nvidia_gaming.sh

# Oppstart av skript
echo -e "\nDette skriptet vil installere drivere for moderne Nvidia grafikkort og annen programvare du trenger få spille på Fedora Linux. Underveis kan det hende at du må skrive inn passordet ditt flere ganger."
read -p "Trykk [Enter] for å starte..."

# Installerer Nvidia-drivere for Nvidia GPU fra 2017 og nyere.
# NB: Hvis Secure Boot er aktivert i BIOS, kan det skape problemer ved restart, sjekk: https://rpmfusion.org/Howto/Secure%20Boot
echo "Installerer nyeste Nvidia-drivere via DNF. Du må antagelig skrive inn passordet ditt."
sudo dnf install akmod-nvidia

# Ferdig med å installere Nvidia-drivere
echo -e "\nMerk: Det kan ta opp mot 5 minutter før driveren er helt oppdatert"
read -p "Trykk [Enter] for sjekke driver-versjon..."

# Oppdater med DNF
echo -e "\nSjekker Nvidia-versjon, om det ikke kommer opp et versonsnummer, vent noen minutter før du går videre:"
modinfo -F version nvidia
read -p "Trykk [Enter] for å teste driver-versjon en gang til..."

# Oppdater med DNF
echo -e "\nSjekker Nvidia versjon en gang til, bare for å være sikker."
modinfo -F version nvidia
read -p "Trykk [Enter] for å fortsette..."

# Bytter ut åpne ffmpeg codecs med proprietære
echo -e "\nInstallerer alle ffmpeg codecs (trengs ofte for cutscenes og intro til spill)."
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
read -p "Trykk [Enter] for å fortsette..."

# Hardware codecs for Nvidia
echo -e "\nInstallerer hardware codecs for Nvidia."
sudo dnf install libva-nvidia-driver
read -p "Trykk [Enter] for å fortsette..."

# Gstreamer framwork og mer..
echo -e "\nInstallerer andre proprietære codecs du kan trenge."
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
read -p "Trykk [Enter] for å fortsette..."

# Installere GameMode
echo -e "\nInstallerer Gamemode via DNF (det kan hende dette er installert fra før)."
sudo dnf install gamemode
read -p "Trykk [Enter] for å fortsette..."

# Installere ProtonPlus
echo -e "\nInstallerer ProtonPlus via Flatpak."
flatpak install flathub com.vysp3r.ProtonPlus
read -p "Trykk [Enter] for å fortsette..."

# Installere Steam
echo -e "\nInstallerer Steam via DNF."
sudo dnf install steam
read -p "Trykk [Enter] for å fortsette..."

# Installere Heroic Launcher
echo -e "\nInstallerer Heroic Launcher via Flatpak (for å kunne spille spill fra Epic og GoG)."
flatpak install heroic

# Fullført melding
echo -e "\nNå er Fedora klart for gaming, men ta en restart først, så du er sikker på at de beste Nvidia-driverne blir brukt."
read -p "Trykk [Enter] for å ta en restart av PC'en..."

#restart
sudo shutdown -r now
