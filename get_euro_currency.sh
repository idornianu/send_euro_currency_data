#! /bin/bash

#NOTE: This script is intended for personal use only.

#variables
USERNAME=$(whoami)
DATE=$(date "+%d-%m-%Y")
DAY_OF_WEEK=$(date +%u)
ATTEMPT=1
MAX_ATTEMPTS=3
RECIPIENT="INSERT_EMAIL_ADDRESS_HERE"

#functions
download_data() {
  while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
    curl https://bnr.ro/RSS_200003_EUR.aspx >> /home/$USERNAME/output.txt
    if [ -s /home/$USERNAME/output.txt ]; then
      return 0  # Success
    else
      echo "Attempt $ATTEMPT: Download failed or empty. Retrying..."
      ((attempt++))
      sleep 10  # Wait for 10 seconds before retrying
    fi
  done
  echo "Failed to download data after $MAX_ATTEMPTS attempts."
  return 1  # Failure
}

#initiate the download process
truncate -s 0 /home/$USERNAME/output*

if [ "$DAY_OF_WEEK" -eq 1 ]; then
  YESTERDAY=$(date -d "last Friday" "+%d-%m-%Y")
else
  YESTERDAY=$(date -d "yesterday" "+%d-%m-%Y")
fi

download_data

cat /home/$USERNAME/output.txt | grep $YESTERDAY >> /home/$USERNAME/output_final.txt

if [ ! -s /home/$USERNAME/output_final.txt ]; then
  echo "No value. Exiting."
  exit 1
fi

#gather the exchange rate and the date, remove the HTML tags, send email
EXCHGRT=$(awk '{print $1, $2, $3, $4}' /home/$USERNAME/output_final.txt)
EMAIL_BODY=$(echo "$EXCHGRT RON - $DATE" | sed -e 's/<title>//; s/<\/title>//')

echo $EMAIL_BODY | s-nail -s "Valoare EURO $(date "+%d-%m-%Y")" $RECIPIENT

exit
