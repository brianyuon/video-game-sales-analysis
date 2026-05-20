-- ================================================
-- Video Game Sales Analysis Queries
-- Dataset: Video Game Sales with Ratings (Kaggle)
-- Tool: DB Browser for SQLite
-- ================================================

-- Query 1: Average global sales by score bucket
-- Do critically acclaimed games outsell poor ones?

SELECT 
    Score_Bucket,
    COUNT(*) AS Number_of_Games,
    ROUND(AVG(Global_Sales), 2) AS Avg_Global_Sales,
    ROUND(SUM(Global_Sales), 2) AS Total_Global_Sales
FROM cleaned_data
WHERE Year_of_Release BETWEEN 1995 AND 2015
    AND Score_Bucket != 'No Score'
GROUP BY Score_Bucket
ORDER BY Avg_Global_Sales DESC;

-- ------------------------------------------------

-- Query 2: Critic vs user score gap by genre
-- Which genres had the biggest disconnect?

SELECT 
    Genre,
    COUNT(*) AS Number_of_Games,
    ROUND(AVG(Critic_Score), 2) AS Avg_Critic_Score,
    ROUND(AVG(User_Score_Normalized), 2) AS Avg_User_Score_Normalized,
    ROUND(AVG(Critic_Score) - AVG(User_Score_Normalized), 2) AS Score_Gap
FROM cleaned_data
WHERE Year_of_Release BETWEEN 1995 AND 2015
    AND Critic_Score IS NOT NULL
    AND User_Score_Normalized IS NOT NULL
GROUP BY Genre
ORDER BY Score_Gap DESC;

-- ------------------------------------------------

-- Query 3: Top 20 best-selling games
-- Did the best sellers have the highest scores?

SELECT 
    Name,
    Genre,
    Platform,
    Publisher,
    Year_of_Release,
    Global_Sales,
    Critic_Score,
    User_Score_Normalized,
    Score_Bucket
FROM cleaned_data
WHERE Year_of_Release BETWEEN 1995 AND 2015
    AND Global_Sales IS NOT NULL
ORDER BY Global_Sales DESC
LIMIT 20;

-- ------------------------------------------------

-- Query 4: Publisher analysis
-- Which publishers got high scores AND high sales?

SELECT 
    Publisher,
    COUNT(*) AS Number_of_Games,
    ROUND(AVG(Global_Sales), 2) AS Avg_Global_Sales,
    ROUND(SUM(Global_Sales), 2) AS Total_Global_Sales,
    ROUND(AVG(Critic_Score), 2) AS Avg_Critic_Score
FROM cleaned_data
WHERE Year_of_Release BETWEEN 1995 AND 2015
    AND Global_Sales IS NOT NULL
    AND Critic_Score IS NOT NULL
GROUP BY Publisher
HAVING COUNT(*) >= 10
ORDER BY Avg_Global_Sales DESC
LIMIT 15;
