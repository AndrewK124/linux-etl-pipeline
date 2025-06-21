# Linux ETL Pipeline
This project demonstrates an ETL pipeline built in an Ubuntu environment designed to process transaction data with standard command-line utilities. It emphasizes the power and flexibility of shell scripting and tools such as scp, bunzip2, awk, and other core Unix utilites to extract compressed files, clean and transform data, and generate practical reports.

## ETL Workflow
Extract: 
- transfer_transaction_file.sh: Copy the compressed transaction file from a remote server using scp 

Decompress: 
- unzip_transaction_file.sh: Decompress the .bz2 file using bunzip2

Transform: 
- remove_header.sh: Remvoe the header row from the data
- convert_to_lowercase.sh: Convert all text to lowercase for consistency
- normalize_gender.sh: Normalize gender field to m, f, or u (male, female, undisclosed)
- filter_state_field.sh: Remove rows with missing or "NA" state fields. Invalid rows are saved to "exceptions.csv"
- remove_dollar_sign.sh: Remove dollar signs from purchase amounts to make them numeric.
- sort_transaction_file.sh: Sort transactions by customer ID and save as "transaction.csv"

Load and Report: 
- generate_summary_file.sh: Aggregates purchase totals by customer ID, region, and demographics. Output: summary.csv
- generate_transaction_report.sh: Generates a state-wise transaction count report. Output: transaction.rpt
- generate_purchase_report.sh: Generates a report of ttal purchase amounts by state and gender. Output: purchase.rpt

## Usage
Here's an example of how to run the pipeline: 
```
# Step 1: Extract
./transfer_transaction_file.sh 192.168.1.10 user /path/to/transactions.bz2

# Step 2: Decompress
./unzip_transaction_file.sh transactions.bz2

# Step 3: Transform
./remove_header.sh transactions
./convert_to_lowercase.sh transactions
./normalize_gender.sh transactions
./filter_state_field.sh transactions
./remove_dollar_sign.sh transactions
./sort_transaction_file.sh transactions

# Step 4: Load and Generate Reports
./generate_summary_file.sh transaction.csv
./generate_transaction_report.sh
./generate_purchase_report.sh
```

## Warning
Because the server containing the source data was shut down, it is currently impossible to run the ETL script from end-to-end. However, I did keep a copy of the source file so you can run the file from step 2 all the way to the end. 

