# send_euro_currency_data
This script gather the value of the Euro currency and checks what value it has. An email will be sent to the provided email addresses with the EURO value for that day.
A cron job will be implemented to run the script at 10:00 RO time from Monday to Friday, every week.
An additional cron job will be created in order to send the email with the output at 10:15am RO Time from Monday to Friday.

The script runs following this set of instructions:
  - it will fetch the EURO value from the https://bnr.ro/RSS_200003_EUR.aspx on a remote server where the script is located
  - using grep, the value of the Euro currency will be placed in an output file locally
  - it will send an email with the output of the output_final.txt file to the provided email addresses using a cron job
  - the script will empty the contents from all the output* files so it can fetch the value of the EURO currency the next day
