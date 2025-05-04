# ADD THIS SCRIPT TO CRONTAB
0 8,12,15 * * * /usr/bin/python3 ./scrapping.py 
0 0 * * * /bin/bash ./data_cleansing.sh