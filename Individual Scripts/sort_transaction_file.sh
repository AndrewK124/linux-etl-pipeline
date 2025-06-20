# Andrew Key 
# 11/25/2024
# Final Project 
#!/bin/bash 

# Assign the transaction file to a variable 
transaction_file="$1"

# Assign transaction.csv to a variable 
output_file="transaction.csv"

# Sort the file by customer_id
sort -t, -k1,1 "$1"> "$output_file"
:
# Exit cleanly 
exit 0 
