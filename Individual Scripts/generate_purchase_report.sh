# Andrew Key 
# 12/4/2024
# Final Project 
#!/bin/bash

# Define variables for the input and outfile files
input_file="transaction.csv" 
output_file="purchase.rpt"

# My name
firstname="Andrew" 
lastname="Key"

# Generate report 
{ 
    # Headers 
    echo "Report by: $firstname $lastname" 
    echo "Purchase Total Report" 
    echo "" 
    printf "%-8s %-8s %-15s\n" "State" "Gender" "Purchase Amount" 

    # Process transaction.csv 
    awk -F, ' 
        BEGIN { OFS = "," } 
        { 
            # Conver state and gender to uppercase
            state = toupper($12); 
            gender = toupper($5); 

            # Gather purchase amounts by state and gender 
            total[state, gender] += $6; 
        } 
        END { 
            # Print results 
            for (key in total) { 
                split(key, parts, SUBSEP); 

                # Round the purchase amount to the nearest hundred
                rounded_total = int(total[key] / 100 + 0.5) * 100; 
                
                # Print values 
                printf "%-8s %-8s %-15s\n", parts[1], parts[2], rounded_total; 
                } 
            }
        ' "$input_file" | sort -t, -k3,3nr -k1,1 -k2,2 # Sort by purchase amount, state, and gender
} > "$output_file"

