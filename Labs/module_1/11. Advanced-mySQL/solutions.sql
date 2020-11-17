#Lab | Advanced MySQL 17/11
use publications;
select * from titleauthor;
select * from titles;
select * from sales;

#Challange 1
#step1
SELECT ta.title_id AS "TITLE ID",ta.au_id AS "AUTHOR ID",IFNULL(t.advance*ta.royaltyper/100,0) AS "ADVANCE",
IFNULL(t.price*s.qty*t.royalty/100*ta.royaltyper/100,0) AS "ROYALITY"
FROM titleauthor AS ta
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
ORDER BY ta.title_id;

#step2
SELECT ta.title_id AS "TITLE ID",ta.au_id AS "AUTHOR ID",COUNT(ta.title_id) AS "COUNT", SUM(IFNULL(t.price*s.qty*t.royalty/100*ta.royaltyper/100,0)) AS "ROYALITY"
FROM titleauthor AS ta
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
GROUP BY ta.title_id;

#step3
SELECT ta.au_id AS "AUTHOR ID",
 ROUND(SUM(IFNULL(t.price*s.qty*t.royalty/100*ta.royaltyper/100,0)) + IFNULL(t.advance*ta.royaltyper/100,0),3) AS total_profits
FROM titleauthor AS ta
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
GROUP BY ta.title_id
ORDER BY total_profits DESC LIMIT 3;

######################################################################################################
#Challange 2

select tb1_au_id AS "AUTHOR ID", 
ROUND(SUM(IFNULL(tb1_price * tb1_qty * tb1_royality / 100 * tb1_royaltyper / 100 ,0)) + IFNULL(tb1_advance * tb1_royaltyper/100,0),3) AS total_profits
FROM(
SELECT ta.title_id AS tb1_title_id, ta.au_id AS tb1_au_id, t.advance AS tb1_advance, 
ta.royaltyper AS tb1_royality, t.price AS tb1_price, s.qty AS tb1_qty, ta.royaltyper AS tb1_royaltyper
FROM titleauthor AS ta
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
)
AS table1
GROUP BY tb1_title_id
ORDER BY total_profits DESC LIMIT 3;


######################################################################################################
#Challange 3

create temporary table most_profiting_authors 
SELECT ta.title_id AS tb1_title_id, ta.au_id AS tb1_au_id, t.advance AS tb1_advance, 
ta.royaltyper AS tb1_royality, t.price AS tb1_price, s.qty AS tb1_qty, ta.royaltyper AS tb1_royaltyper
FROM titleauthor AS ta
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id;

select tb1_au_id "AUTHOR ID", 
ROUND(SUM(IFNULL(tb1_price * tb1_qty * tb1_royality / 100 * tb1_royaltyper / 100 ,0)) + IFNULL(tb1_advance * tb1_royaltyper/100,0),3) AS total_profits
from most_profiting_authors 
GROUP BY tb1_title_id
ORDER BY total_profits DESC LIMIT 3;

