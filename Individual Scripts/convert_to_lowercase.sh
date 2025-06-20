# Andrew Key 
# 11/25/2024 
# Final Project 
#!/bin/bash 

# Assign the transaction file to a variable 
transaction_file="$1"

# Make a temp file 
temp=$(mktemp)

# Convert everything to lowercase and save it to temp 
tr '[:upper:'] '[:lower:]' < "$transaction_file" > "$temp" 

# Overwrite the temp file with the transaction file 
mv "$temp" "$transaction_file"

# Exit cleanly
exit 0 
