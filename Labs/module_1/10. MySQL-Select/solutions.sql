#Lab | MySQL Select 17/11
use publications;
#exercice1
SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME",au_fname AS "FIRST NAME",title AS "TITLE", pub_name AS "PUBLISHER"
FROM titleauthor AS ta
LEFT JOIN authors AS a ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id=p.pub_id;

#exercice2
SELECT a.au_id AS "AUTHOR ID", au_lname AS "LAST NAME",au_fname AS "FIRST NAME", pub_name AS "PUBLISHER",COUNT(t.title) AS "COUNT TITLE" 
FROM titleauthor AS ta
LEFT JOIN authors AS a ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id=p.pub_id
GROUP BY t.title;

#exercice3
SELECT table1.id AS "AUTHOR ID", au_lname AS "LAST NAME",au_fname AS "FIRST NAME", qty AS "TOTAL"
FROM(
SELECT a.au_id AS id, au_lname ,au_fname , qty
FROM titleauthor AS ta
LEFT JOIN authors AS a ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id
ORDER BY qty DESC LIMIT 3
) AS table1;

#exercice4
SELECT table2.id AS "AUTHOR ID", au_lname AS "LAST NAME",au_fname AS "FIRST NAME", IFNULL(qty,0) AS "TOTAL"
FROM(
SELECT a.au_id AS id, au_lname ,au_fname , qty
FROM titleauthor AS ta
LEFT JOIN authors AS a ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN sales AS s ON t.title_id = s.title_id

ORDER BY qty DESC

) AS table2 ;
