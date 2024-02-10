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

# Muunnetaan Cloverin ACPI-asetukset OpenCorelle
sed -n '/<key>ACPI<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "ACPI" tekstin tilalle "ACPI:"
sed -i '' 's/<key>ACPI<\/key>/<key>ACPI:<\/key>/g' "$output_file"

# Lisätään OpenCoren ACPI-asetukset Clover-tiedoston perään
sed -n '/<key>Booter<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Muunnetaan Cloverin DeviceProperties-asetukset OpenCorelle
sed -n '/<key>Devices<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "DeviceProperties" tekstin tilalle "DeviceProperties:"
sed -i '' 's/<key>Devices<\/key>/<key>Devices:<\/key>/g' "$output_file"

# Lisätään OpenCoren DeviceProperties-asetukset Clover-tiedoston perään
sed -n '/<key>Boot<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Muunnetaan Cloverin Kernel-asetukset OpenCorelle
sed -n '/<key>KernelAndKextPatches<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "KernelAndKextPatches" tekstin tilalle "KernelAndKextPatches:"
sed -i '' 's/<key>KernelAndKextPatches<\/key>/<key>KernelAndKextPatches:<\/key>/g' "$output_file"

# Lisätään OpenCoren Kernel-asetukset Clover-tiedoston perään
sed -n '/<key>Boot<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Muunnetaan Cloverin Misc-asetukset OpenCorelle
sed -n '/<key>Misc<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "Misc" tekstin tilalle "Misc:"
sed -i '' 's/<key>Misc<\/key>/<key>Misc:<\/key>/g' "$output_file"

# Lisätään OpenCoren Misc-asetukset Clover-tiedoston perään
sed -n '/<key>Boot<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Muunnetaan Cloverin NVRAM-asetukset OpenCorelle
sed -n '/<key>RtVariables<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "RtVariables" tekstin tilalle "RtVariables:"
sed -i '' 's/<key>RtVariables<\/key>/<key>RtVariables:<\/key>/g' "$output_file"

# Lisätään OpenCoren NVRAM-asetukset Clover-tiedoston perään
sed -n '/<key>Boot<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Muunnetaan Cloverin PlatformInfo-asetukset OpenCorelle
sed -n '/<key>SMBIOS<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "SMBIOS" tekstin tilalle "PlatformInfo:"
sed -i '' 's/<key>SMBIOS<\/key>/<key>PlatformInfo:<\/key>/g' "$output_file"

# Lisätään OpenCoren PlatformInfo-asetukset Clover-tiedoston perään
sed -n '/<key>NVRAM<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Muunnetaan Cloverin UEFI-asetukset OpenCorelle
sed -n '/<key>UEFI<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "UEFI" tekstin tilalle "UEFI:"
sed -i '' 's/<key>UEFI<\/key>/<key>UEFI:<\/key>/g' "$output_file"

# Lisätään OpenCoren UEFI-asetukset Clover-tiedoston perään
sed -n '/<key>Boot<\/key>/,/<\/dict>/p' "$clover_file" >> "$output_file"

# Tulostetaan muunnos onnistuneesti
echo "Cloverista OpenCoreen muunnos suoritettu. Tulostettu tiedostoon: $output_file."
