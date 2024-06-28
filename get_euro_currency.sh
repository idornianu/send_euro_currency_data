#! /bin/bash

#user who runs the script
USERNAME=$(whoami)

#exchange rate for EURO
EXCHGRT=$(awk '{print $1, $2, $3, $4}' /home/$USERNAME/output_final.txt)

#today's date
DATE=$(date "+%d-%m-%Y")

#determine what day of the week it is ( from 1 to 5 )
DAY_OF_WEEK=$( date +%u)

#set the date to search for based on the DAY_OF_WEEK value ( from 1 to 5 )
if [ "$DAY_OF_WEEK" -eq 1 ]; then
  YESTERDAY=$(date -d "last Friday" "+%d-%m-%Y")
else
  YESTERDAY=$(date -d "yesterday" "+%d-%m-%Y")
fi

#cleanup old file contents
truncate -s 0 /home/$USERNAME/output*

#gather the raw data from BNR
curl https://bnr.ro/RSS_200003_EUR.aspx >> /home/$USERNAME/output.txt

sleep 15

#check for yesterday's date for the EURO value
cat /home/$USERNAME/output.txt | grep $YESTERDAY >> /home/$USERNAME/output_final.txt

#if the final output file is empty, don't send an email
if [ ! -s /home/$USERNAME/output_final.txt ]; then
  echo "No value. Exiting."
  exit 1
fi

#gather the exchange rate from yesterday and the date from today, remove the HTML tags, send email
echo "$EXCHGRT RON - $DATE" | sed -e 's/<title>//; s/<\/title>//' | s-nail -s "Valoare EURO $(date "+%d-%m-%Y")" iuliandornianu97@outlook.com

exit
