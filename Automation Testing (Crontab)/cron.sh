# ADD THIS SCRIPT TO CRONTAB
0 8,12,15 * * * /usr/bin/python3 ./scrapping.py #“./scrapping.py” can be change to path to scrapping.py
0 0 * * * /bin/bash ./data_cleansing.sh #“./data_cleansing.sh” can be change to path to data_cleansing.sh
