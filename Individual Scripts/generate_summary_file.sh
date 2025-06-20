# Andrew Key 
# 11/25/2024 
# Final Project 
#!/bin/bash 

# Assign the transaction file argument to a variable 
transaction_file="$1"

# Assign summary.csv to a variable 
summary_file="summary.csv"

# Generate summary.csv 
awk -F, ' 
BEGIN { OFS = "," } 
{ 
		# Accumulate total purchase amount and count per customerID 
		customer[$1 "," $12 "," $13 "," $3 "," $2] += $6; 
} 
END { 
    for (key in customer) { 
	    split(key, fields, ","); 
	    print fields[1], fields[2], fields[3], fields[4], fields[5], customer[key]; 
	}
}
' "$transaction_file" | sort -t, -k2,2 -k3,3nr -k4,4 -k5,5 > "$summary_file"
