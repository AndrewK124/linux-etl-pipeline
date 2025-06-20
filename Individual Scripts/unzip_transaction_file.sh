# Andrew Key 
# Final Project 
# 11/25/2024 
#!/bin/bash 

# Assign the transaction file to a variable
transaction_file="$1" 

# Use bunzip2 to decompress the file 
bunzip2 "$transaction_file" 

# Exit cleanly 
exit 0 
