# The Golden Era of Video Games — Did Critics and Players Agree? (1995–2015)

## Project Overview
An exploratory data analysis of 7,744 video games released between 1995 and 2015, 
examining whether critical acclaim drove commercial success and where critics and 
players disagreed most.

## Business Questions
1. Do critically acclaimed games actually outsell poorly reviewed ones?
2. Which genres had the biggest gap between critic and player scores?
3. Did the best-selling games have the highest critic scores?
4. Which publishers consistently achieved both high scores and high sales?

## Tools Used
- **Google Sheets** — data cleaning and pivot tables
- **SQL (DB Browser for SQLite)** — data analysis and querying
- **Tableau Public** — dashboard and visualizations

## Files in this Repository
- `README.md` — project overview and key findings
- `analysis_queries.sql` — all 4 SQL queries used in the analysis

## Data Source
- [Video Game Sales with Ratings](https://www.kaggle.com/datasets/rush4ratio/video-game-sales-with-ratings) 
  via Kaggle
- 16,719 games originally — filtered to 7,744 games after cleaning

## Data Cleaning Steps
- Removed 4 rows with blank Genre
- Replaced 2,425 "tbd" User Score entries with blanks
- Added User_Score_Normalized column (User Score × 10 to match Critic Score scale)
- Added Score_Bucket column (Critically Acclaimed / Well Reviewed / Mixed / Poor)
- Removed 4 duplicate rows and 4 blank Publisher rows
- Filtered to 1995–2015 for data completeness and reliability

## Key Findings

### 1. Critical Acclaim Does Drive Individual Sales
Critically Acclaimed games averaged **2.05 million copies sold** — nearly 3x more 
than Well Reviewed games (0.75M) and nearly 9x more than Poor games (0.23M). 
However, Well Reviewed games generated the most total industry revenue at 2.43 
billion simply due to volume.

### 2. Puzzle Games Had the Biggest Critic-Player Disconnect
Puzzle games had the largest gap between critic scores (67.2) and user scores (38.9) 
— a 28-point difference. Role-Playing was the only genre where players scored higher 
than critics (74.46 vs 72.55), suggesting a passionate fanbase that critics 
underappreciate.

### 3. Sales Don't Always Follow Critical Scores
7 of the top 20 best-selling games were Mixed or unreviewed. Wii Sports — the 
best-selling game at 82.53 million copies — was only "Well Reviewed" with a critic 
score of 76. Five Pokémon titles sold over 15 million copies each with no Metacritic 
score at all.

### 4. Nintendo Dominates in Sales Despite Not Having the Highest Scores
Nintendo averaged **2.84 million sales per game** — nearly double the nearest 
competitor Microsoft Game Studios (1.51M) — despite not having the highest average 
critic score. MTV Games had the highest avg critic score (80.56) but averaged only 
0.8M sales per game.

## Dashboard
[View the interactive Tableau Public dashboard here](https://public.tableau.com/views/TheGoldenEraofVideoGamesDidCriticsandPlayersAgree1995-2015/SalesCriticalAcclaim?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) 

## Notes
- GTA V appeared on both PS3 and X360 in the raw data and is combined into a single 
  entry in the Top 20 chart showing total sales across both platforms
- Critic and User scores are only available for a subset of games — analyses
  involving scores exclude games with no Metacritic data
