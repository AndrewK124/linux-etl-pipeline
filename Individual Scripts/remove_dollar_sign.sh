# Andrew Key 
# 11/26/2024
# Final Project 
#!/bin/bash 

# Assign transaction file argument to a variable 
transaction_file="$1" 

# Make temp file 
temp=$(mktemp)

# Remove the $ sign from the purchase amt field via awk 
awk -F, 'BEGIN { OFS = FS } 
{ 
    gsub(/^\$/, "", $6); # Remove $ in the 6th column 
    print $0; 
}' "$transaction_file" > "$temp"

# Overwrite the transaction file with the temp file 
mv "$temp" "$transaction_file"

# Exit cleanly 
exit 0
