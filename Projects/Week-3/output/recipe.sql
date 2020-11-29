# Project Week-3
# Web Scraping : Recipes from CuisineAZ

USE cuisine_az;
SELECT * FROM recipes;

SELECT title, total_time, difficulty, category
FROM recipes
GROUP BY category
ORDER BY total_time;

SELECT title, total_time, difficulty, rating, category
FROM recipes
ORDER BY rating DESC;