#! /bin/bash

USERNAME=$(whoami)
YESTERDAY=$(date -d "yesterday" "+%d-%m-%Y")
EXCHGRT=$(awk '{print $1, $2, $3, $4}' /home/$USERNAME/output_final.txt)
DATE=$(date "+%d-%m-%Y")

truncate -s 0 /home/$USERNAME/output*

curl https://bnr.ro/RSS_200003_EUR.aspx >> /home/$USERNAME/output.txt

cat /home/$USERNAME/output.txt | grep $YESTERDAY >> /home/$USERNAME/output_final.txt

if [ ! -s /home/$USERNAME/output_final.txt ]; then
  echo "No value. Exiting."
  exit 1
fi

echo "$EXCHGRT RON - $DATE" | sed -e 's/<title>//; s/<\/title>//' | s-nail -s "Valoare EURO $(date "+%d-%m-%Y")" iuliandornianu97@outlook.com

exit
