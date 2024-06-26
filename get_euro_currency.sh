#! /bin/bash

USERNAME=$(whoami)
#VALUE=$(cat /home/$USERNAME/Output_final.txt)
#TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

truncate -s 0 /home/$USERNAME/output*

curl https://bnr.ro/RSS_200003_EUR.aspx >> /home/$USERNAME/output.txt

cat /home/$USERNAME/output.txt | grep "$(date "+%d-%m-%Y")" >> /home/$USERNAME/output_final.txt

if [ ! -s /home/$USERNAME/output_final.txt ]; then
  echo "No value. Exiting."
  exit 1
fi

echo $(cat /home/$USERNAME/output_final.txt) | sed -e 's/<title>//; s/<\/title>//' | s-nail -s "Valoare EURO $(date "+%d-%m-%Y")" iuliandornianu97@outlook.com

#cat /home/$USERNAME/output.txt | grep -i EUR >> /home/$USERNAME/output2.txt
#cat /home/$USERNAME/output2.txt | egrep -o '4.80|4.81|4.82|4.83|4.84|4.85|4.86|4.87|4.88|4.92|4.93|4.94|4.95|4.96|4.97|4.98|4.99|5.00' >> /home/$USERNAME/Output_final.txt
#truncate -s 0 /home/$USERNAME/output*
#
#if [ $VALUE >= '4.92' ];
# then
#    echo "Valoarea Euro este $VALUE . Puteti vinde Euro." | mail -s "Euro are valoare ridicata" iuliandornianu97@outlook.com 
# else
#    echo "Euro price is not good. $VALUE EUR - $TIMESTAMP" >> /home/$USERNAME/Send_Euro_Data.log
#fi
#
#if [ $VALUE <= '4.88' ];
# then
#    echo "Valoarea Euro este $VALUE . Puteti cumpara Euro." | mail -s "Euro are valoare scazuta" iuliandornianu97@outlook.com
# else
#    echo "Euro price is not good. $VALUE EUR - $TIMESTAMP" >> /home/$USERNAME/Send_Euro_data.log
#fi

#truncate -s 0 /home/$USERNAME/Output_final.txt

exit
