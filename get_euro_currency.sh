#! /bin/bash

USERNAME=idornianu
VALUE=$(cat /home/$USERNAME/Output_final.txt)
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

curl https://bnr.ro/Home.aspx >> /home/$USERNAME/output.txt
cat /home/$USERNAME/output.txt | grep -i EUR >> /home/$USERNAME/output2.txt
cat /home/$USERNAME/output2.txt | grep -o '4.92' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.93' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.94' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.95' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.96' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.97' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.98' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.99' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '5.00' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.88' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.87' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.86' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.85' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.84' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.83' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.82' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.81' >> /home/$USERNAME/Output_final.txt
cat /home/$USERNAME/output2.txt | grep -o '4.80' >> /home/$USERNAME/Output_final.txt
truncate -s 0 /home/$USERNAME/output*

if [ $VALUE >= 4.92 ];
 then
    echo "Valoarea Euro este $VALUE . Puteti vinde Euro." | mail -s "Euro are valoare inalta" iuliandornianu97@outlook.com
 else
    echo "Euro price is not good. $VALUE EUR - $TIMESTAMP" >> /home/$USERNAME/Send_Euro_Data.log
fi

if [ $VALUE <= '4.88' ];
 then
    echo "Valoarea Euro este $VALUE . Puteti cumpara Euro." | mail -s "Euro are valoare scazuta" iuliandornianu97@outlook.com
 else
    echo "Euro price is not good. $VALUE EUR - $TIMESTAMP" >> /home/$USERNAME/Send_Euro_data.log
fi

truncate -s 0 /home/$USERNAME/Output_final.txt

exit
