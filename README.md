# send_euro_currency_data
This script gather the value of the Euro currency and checks what value it has. Depending on that, an email will be sent to the provided email addresses
An additional cron job will be implemented to run the script at 07:00 RO time from Monday to Friday, every week.

The script's logic is as follows:
  - it will wget the https://bnr.ro webpage on a remote server
  - using grep, the value of the Euro currency will be placed in an output file locally
  - the script will check if the value is higher than 4.92 or lower than 4.88 and depending on the case it will:
    a. send an email if the value is equal or lower than 4.88 with the title "Euro currency is at low value"
    b. send an email if the value is equal or higher than 4.92 with the title "Euro currency is at a high value"
    c. update the Send_Euro_data.log file with the value for the day when the currency is not tradeable.
  - the script will empty the contents from all the output.txt files
    
An additional cron job will be created in order to send the email with the output at 07:00am RO Time from Monday to Friday.
