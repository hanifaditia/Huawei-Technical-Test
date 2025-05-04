# HUAWEI Technical Test

**Author:** Hanif Aditia Sofian  
**Email:** hanifaditia.sofian@gmail.com  


## Backend API

### Features

- Submit form data (`name`, `message`)
- Retrieve all data
- Search by name

### Requirements

- Node.js
- Express.js
- CORS
- npm

### Getting Started

#### 1. Initialize Node.js Project
```bash
npm init -y
```

#### 2. Install Dependencies
```bash
npm install express cors
```

#### 3. Run the Server
```bash
node Backend.js
```

### Testing the API

#### Option 1: Using Frontend
- `Submit.html` — Form submission
- `Search.html` — Data retrieval

#### Option 2: Using curl

Submit form:
```bash
curl -X POST http://localhost:3000/submit-form -H "Content-Type: application/json" -d "{\"name\": \"Hanif Aditia\", \"message\": \"Hallo\"}"
```

Get all messages:
```bash
curl http://localhost:3000/form-data
```

Search by name:
```bash
curl "http://localhost:3000/search?name=Hanif%20Aditia"
```

---

## Automation Scripts

### Purpose

Automated web scraping of [detik.com](https://www.detik.com) and cleanup of old data (older than 30 days).

### Structure

- `scrapping.py` — Scrapes article titles and links
- `data_cleansing.sh` — Deletes outdated data
- Scrapped file located in the `cron/` folder

### Requirements

#### Python:
- `beautifulsoup4`
- `requests`

#### Linux (Tested on WSL):
- `crontab`

### Setup

#### 1. Install Python & Pip
```bash
sudo apt update
sudo apt install python3 python3-pip
```

#### 2. Install Python Libraries
```bash
pip3 install beautifulsoup4 requests
```

#### 3. Set Up Crontab
```bash
crontab -e
```

Add the following cron script:
“./scrapping.py” can be change to path to scrapping.py

“./data_cleansing.sh” can be change to path to data_cleansing.sh

```
0 8,12,15 * * * /usr/bin/python3 ./scrapping.py
0 0 * * * /bin/bash ./data_cleansing.sh
```

- Python script runs at 08:00, 12:00, and 15:00
- Bash script runs daily at 00:00

---

## Data Processing (SQL)

### Requirements

- Any SQL database (MySQL, PostgreSQL, etc)

### Initialization
run SQL query in table.sql to create table
### Tasks

1. **Create Table and Insert:**
   - Add employee **Albert**, Engineer, joined **Jan 24, 2024**, **2.5 years** experience, **$50 salary**

2. **Update Salary:**
   - All Engineers' salary updated to **$85**

3. **Calculate Total Salary in 2021**
   - SQL query for **monthly** or **yearly** salary

4. **Sort Top 3 Employees by Experience**

5. **Subquery:**
   - Engineers with ≤ 3 years experience

---

## 📩 Contact

For any questions, reach out at **hanifaditia.sofian@gmail.com**
