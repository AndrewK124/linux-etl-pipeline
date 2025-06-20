# Andrew Key 
# Final Project 
# 11/24/2024
#!/bin/bash 

# Variables  
remote_server="$1"                  # Server IP
remote_userID="$2"                  # userID
remote_file="$3"                    # File path of the remote file 
destination="$(pwd)"                # Destination of the remote file is your working directory

# Use scp to get the source file from the server 
scp "${remote_userID}@${remote_server}:${remote_file}" "${destination}"

# Check if the transfer worked 
if [ $? -eq 0 ]; then 
    echo "Transfer complete." 
else 
    echo "Transfer failed." 
fi

# Exit cleanly 
exit 0
