# Andrew Key 
# 11/25/2024
# Final Project 
#!/bin/bash 

# Assign the transaction file argument to a variable 
transaction_file="$1"

# Make a temp file 
temp=$(mktemp)

# Assign exceptions.csv to a variable 
exceptions_file="exceptions.csv"

# Filter rows without a state or "NA" via awk 
awk -F, ' 
BEGIN { FS = "," } 

{ 
    if ($12 == "" || $12 == "NA") { 
        print > "'"$exceptions_file"'"
    } else { 
        print > "'"$temp"'"
    }
}
' "$transaction_file" 

# Overwrite the transaction file with the temp file
mv "$temp" "$transaction_file"

# Exit Cleanly
exit 0

