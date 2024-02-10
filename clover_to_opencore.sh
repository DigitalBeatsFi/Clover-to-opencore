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
output_file="opencore_acpi.plist"

# Muunnetaan Cloverin ACPI-asetukset OpenCorelle
sed -n '/<key>ACPI<\/key>/,/<\/dict>/p' "$clover_file" > "$output_file"

# Lisätään uudelle riville "ACPI:" tekstin tilalle ":"
sed -i '' 's/<key>ACPI<\/key>/<key>:<\/key>/g' "$output_file"

# Korvataan "AutoMerge" avain "MergeMask" avaimella
sed -i '' 's/<key>AutoMerge<\/key>/<key>MergeMask<\/key>/g' "$output_file"

# Lisätään uudelle riville "Add" tekstin tilalle "Add:"
sed -i '' 's/<key>AddProperties<\/key>/<key>Add:<\/key>/g' "$output_file"

# Lisätään uudelle riville "Drop" tekstin tilalle "Drop:"
sed -i '' 's/<key>DropTables<\/key>/<key>Drop:<\/key>/g' "$output_file"

# Lisätään uudelle riville "Enabled" tekstin tilalle "Enabled:"
sed -i '' 's/<key>FixHeaders<\/key>/<key>FixHeaders:<\/key>/g' "$output_file"

# Tulostetaan muunnos onnistuneesti
echo "ACPI-asetukset on muunnettu onnistuneesti tiedostosta $clover_file tiedostoon $output_file OpenCorelle."
