import requests
from bs4 import BeautifulSoup
import csv
from datetime import datetime
import os

def scrape_detik():
    url = "https://news.detik.com/indeks"

    # Website Request
    response = requests.get(url)
    

    if response.status_code == 200:

        soup = BeautifulSoup(response.content, 'html.parser')

        directory = "./cron"
        now = datetime.now()
        date_str = now.strftime("%m%d%Y")
        hour_str = now.strftime("%H.%M")
        filename = f"./cron/cron_{date_str}_{hour_str}.csv"
        
        if not os.path.exists(directory):
            os.makedirs(directory)
            print(f"Directory {directory} created.")

        # Mengambil title berita
        headlines = soup.find_all('h3', class_='media__title')
        
        # Menyimpan di CSV
        with open(filename, mode='w', newline='', encoding='utf-8') as file:
            writer = csv.writer(file)
            writer.writerow(["Title", "Link"]) 
            
            for headline in headlines:
                title = headline.get_text(strip=True)
                link = headline.find('a')['href']
                writer.writerow([title, link])

        print(f"Data collected and saved to {filename}")
    else:
        print("Failed to retrieve data from the website")

scrape_detik()
