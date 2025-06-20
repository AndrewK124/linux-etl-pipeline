# Andrew Key 
# 11/25/2024
# Final Project 
#!/bin/bash 

# Assign the transaction file to a variable 
transaction_file="$1"

# Define a temp variable for the edited transaction file 
temp=$(mktemp)

# Remove the header 
tail -n +2 "$transaction_file" > "$temp"

# Overwrite the transaction file with the temp file 
mv "$temp" "$transaction_file" 

# Exit cleanly 
exit 0
