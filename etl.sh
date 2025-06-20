# Andrew Key 
# 11/26/2024 
# Final Project

# Greetings! This is the ETL script! It will automate all of the script executions for you 
# All you have to do is simply give this script the following: 
# <serverID> <userID> <remote-filepath> 
# and it'll do the rest for you

remote_server="$1" # This is the server ID
remote_usrid="$2" # This is your user ID
remote_file="$3" # This is the file path of the transaction file on the server 

# Step 1: Transfer the source file to your working directory via the scp command
# Assign the output to a variable so step 2 can run
echo "Step 1: Transferring file..."
zipped_MOCK_file=$(./transfer_transaction_file.sh "$remote_server" "$remote_usrid" "$remote_file") 
echo "Complete!"

# Step 2: Unzip the transaction file 
echo "Step 2: Unzipping file..." 
MOCK_file=$(./unzip_transaction_file.sh "$zipped_MOCK_file")
echo "Complete!" 

# Make a copy of the file MOCK_MIX_v2.1.csv and rename it to transaction.csv 
cp "$MOCK_file" transaction.csv
transaction_file="transaction.csv"

# Step 3: Remove the header record from the transaction file 
echo "Step 3: Removing header..."
./remove_header.sh "$transaction_file" 
echo "Complete!" 

# Step 4: Convert all text in the transaction file to lowercase
echo "Step 4: Converting text to lowercase..." 
./convert_to_lowercase.sh "$transaction_file"
echo "Complete!"

# Step 5: Convert the values in the gender field accordingly
echo "Step 5: Converting values in the gender field..."
./normalize_gender.sh "$transaction_file"
echo "Complete!"

# Step 6: Filter all records in the state field in the transaction file that don't have a state or contain "NA" and place these records in exceptions.csv 
echo "Step 6: Filtering records in the state field..." 
./filter_state_field.sh "$transaction_file"
echo "Complete!"

# Step 7: Remove the $ in the transaction file from the purchase amt field
echo "Step 7: Removing the dollar sign in transaction.csv..."
./remove_dollar_sign.sh "$transaction_file"
echo "Complete!" 

# Step 8: Sort transaction file by customerID 
echo "Step 8: Sorting transaction.csv..."
./sort_transaction_file.sh "$transaction_file"
echo "Complete!"

# Step 9: Generate a summary file using the transaction file 
echo "Step 9: Generating summary of transaction.csv..."
./generate_summary_file.sh "$transaction_file"
echo "Complete!"

# Step 10: Generate transaction report 
echo "Step 10: Generating transaction report..." 
./generate_transaction_report.sh "$transaction_file"
echo "Complete!"

# Step 11: Generate purchase report
echo "Step 11: Generating purchase report..."
./generate_purchase_report.sh "$transaction_file"
echo "Complete!"
