# Andrew Key 
# 12/4/2024 
# Final Project 
#!/bin/bash 

# Assign transaction.csv to a variable
input_file="transaction.csv" 

# Assign transaction.rpt to a variable 
output_file="transaction.rpt" 

# My name 
firstname="Andrew" 
lastname="Key"

# Generate report 
{ 
    # Headers 
    echo "Report by: $firstname $lastname" 
    echo "Transaction Count Report" 
    echo "" 
    printf "%-8s %-20s\n" "State" "Transaction Amount"  

    # Process transaction.csv 
    awk -F, ' 
        BEGIN { OFS = "," } 
        { 
            # Convert state abbreviation to uppercase
            state = toupper($12);  
            state_count[state]++; # Count each instance of each state 
        } 
        END { 
            for (state in state_count) { 
                printf "%-8s %-20d\n", state, state_count[state]; 
            } 
        } 
    ' "$input_file" | sort -t, -k2,2nr -k1,1 # Sort by transaction count and then by state
} > "$output_file" 
