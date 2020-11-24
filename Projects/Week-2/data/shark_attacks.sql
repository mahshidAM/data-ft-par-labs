#Lab | Advanced MySQL 17/11
USE shark_attacks;
SELECT * FROM attacks;

SELECT case_number, country, name, COUNT(country) AS count_by_country
FROM attacks
GROUP BY country
ORDER BY count_country DESC;

SELECT case_number, year, country, type
FROM attacks
GROUP BY type;

SELECT case_number, year, country, COUNT(year) AS count_by_year
FROM attacks
GROUP BY year
ORDER BY count_by_year DESC;

SELECT case_number, country, name, number_of_victims , `fatal_(y/n)`
FROM attacks
ORDER BY number_of_victims DESC;