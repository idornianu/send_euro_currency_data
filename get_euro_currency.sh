#! /bin/bash

curl https://bnr.ro/Home.aspx >> /home/idornianu/output.txt
cat /home/idornianu/output.txt | grep -i EUR >> /home/idornianu/output2.txt
cat /home/idornianu/output2.txt | grep -o '4.92' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.93' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.94' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.95' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.96' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.97' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.98' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.99' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '5.00' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.88' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.87' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.86' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.85' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.84' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.83' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.82' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.81' >> /home/idornianu/Output_final.txt
cat /home/idornianu/output2.txt | grep -o '4.80' >> /home/idornianu/Output_final.txt
truncate -s 0 /home/idornianu/output*
exit
