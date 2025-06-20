# Andrew Key 
# 11/25/2024 
# Final Project 
#!/bin/bash 

# Assign the transaction file to a variable 
transaction_file="$1" 

# Make a temp file 
temp=$(mktemp)

# Normalize the gender field 
awk -F',' '
BEGIN { 
    OFS = ","
}

{ 
    if ($5 == "1")  {           # If the value equals 1, change it to f  
        $5 = "f"; 
    } 
    else if ($5 == "0") {       # If the value equals 0, change it to m  
        $5 = "m";
    }
    else if ($5 == "male")  {   # If the value equals male, change it to m 
       $5 = "m"; 
    }
    else if ($5 == "female")  { # If the value equals female, change it to f
        $5 = "f"; 
    }
    else {                      # If the value is something else, change it to u
        $5 = "u"; 
    }

    print $0; 
}' "$transaction_file" > "$temp"

# Overwrite the transaction file with the temp file 
mv "$temp" "$transaction_file"

# Exit cleanly 
exit 0 



