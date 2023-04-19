#!/bin/bash

# Define the URL
url="https://amfiindia.com/spages/NAVAll.txt"

# Fetch the content from the URL using wget
content=$(wget -q -O - "$url")

# Check if output.csv file can be created
if touch output.csv && [ -w output.csv ]; then
  # Extract Scheme Name and Asset Value fields using cut and sed
  echo "$content" | cut -d ';' -f 2,4 | sed 's/;/,/g' > output.csv
  echo "Data has been saved to output.csv"
else
  echo "Error: Unable to create output.csv. Please check write permissions."
fi
