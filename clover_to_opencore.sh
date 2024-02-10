#!/bin/bash

# Tarkista, onko Cloverin config.plist-tiedosto olemassa.
if [ ! -f "$1" ]; then
    echo "Virhe: Cloverin config.plist-tiedostoa ei löydy."
    exit 1
fi

# Määritä Cloverin config.plist -tiedoston sijainti.
clover_config="$1"

# Määritä OpenCoren config.plist -tiedoston sijainti.
opencore_config="$2"

# Funktio muuntaa koko Cloverin config.plist-tiedoston OpenCorelle sopivaksi.
convert_clover_to_opencore() {
    # Tee varmuuskopio alkuperäisestä OpenCoren config.plist-tiedostosta
    cp "$opencore_config" "$opencore_config.bak"

    # Korvaa koko OpenCoren config.plist-tiedosto Cloverin config.plist-tiedostolla
    cp "$clover_config" "$opencore_config"

    echo "Cloverin config.plist-tiedosto on muunnettu OpenCorelle sopivaksi."
}

# Kutsu funktiota muuntaaksesi config.plist-tiedosto
convert_clover_to_opencore

echo "Muunnos suoritettu."
