#!/bin/bash

# Tarkistetaan, että käyttäjä on antanut molemmat tiedostot parametreiksi
if [ "$#" -ne 2 ]; then
    echo "Käytä skriptiä seuraavasti: $0 clover.plist opencore.plist"
    exit 1
fi

# Kopioidaan Clover-tiedoston polku muuttujaan
clover_file="$1"

# Kopioidaan OpenCore-tiedoston polku muuttujaan
opencore_file="$2"

# Luodaan uusi tiedosto OpenCorelle
output_file="opencore_config.plist"

# Muunnetaan Cloverin KernelAndKextPatches-asetukset OpenCorelle
sed -n '/<key>KernelAndKextPatches<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "Kernel" tekstin tilalle "Kernel:"
sed -i '' 's/<key>KernelAndKextPatches<\/key>/<key>Kernel:<\/key>/g' "$output_file"

# Lisätään uudelle riville "Enabled" tekstin tilalle "Enabled:"
sed -i '' 's/<key>AppleRTC<\/key>/<key>AppleRTC:<\/key>/g' "$output_file"
sed -i '' 's/<key>DellSMBIOSPatch<\/key>/<key>DellSMBIOSPatch:<\/key>/g' "$output_file"
sed -i '' 's/<key>ForceKextsToLoad<\/key>/<key>ForceKextsToLoad:<\/key>/g' "$output_file"
sed -i '' 's/<key>KernelLapic<\/key>/<key>KernelLapic:<\/key>/g' "$output_file"
sed -i '' 's/<key>KernelPm<\/key>/<key>KernelPm:<\/key>/g' "$output_file"

# Lisätään uudelle riville "KernelToPatch" tekstin tilalle "KernelToPatch:"
sed -i '' 's/<key>KernelToPatch<\/key>/<key>KernelToPatch:<\/key>/g' "$output_file"

# Lisätään OpenCoren Kernel-asetukset Clover-tiedoston perään
sed -n '/<key>Boot<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Tulostetaan muunnos onnistuneesti
echo "KernelAndKextPatches-asetukset on muunnettu onnistuneesti tiedostosta $clover_file tiedostoon $output_file OpenCorelle."
