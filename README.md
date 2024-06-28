# send_euro_currency_data

#--VERSIONING NAME CONVENTION--
#FOR small bug fixes, the version will be marked as X.x1
#FOR new features added, the version will be marked as X.1
#FOR a whole new design of the script, the version will be marked as 1.x
#
#Where X is the major version, x is the updated version, and what comes after x is a bug fix only
#--VERSIONING NAME CONVENTION--

This script gather the value of the Euro currency and checks what value it has. An email will be sent to the provided email addresses with the EURO value for that day.
A cron job will be implemented to run the script at 10:00 RO time from Monday to Friday, every week.

The script runs following this set of instructions:
  - it will fetch the EURO value from the https://bnr.ro/RSS_200003_EUR.aspx on a remote server where the script is located
  - using grep, the value of the Euro currency will be placed in an output file locally
  - it will send an email with the output of the output_final.txt file to the provided email addresses
  - the script will empty the contents from all the output* files so it can fetch the value of the EURO currency the next day
