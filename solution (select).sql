USE publications;

-- 1

SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       titles.title AS "TITLE", 
       publishers.pub_name AS "PUBLISHER"
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id;

-- 2

SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       publishers.pub_name AS "PUBLISHER",
       COUNT(titles.title) AS "TITLE COUNT"
FROM titleauthor
JOIN authors ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name;

-- 3

SELECT authors.au_id AS "AUTHOR ID",
	   authors.au_lname AS "LAST NAME",
       authors.au_fname "FIRST NAME", 
       SUM(sales.qty) as total
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY total DESC
LIMIT 3;

-- 4

SELECT au_lname, SUM(qty) as total 
	FROM sales 
    JOIN titleauthor
		ON sales.title_id = titleauthor.title_id
	JOIN authors 
		ON titleauthor.au_id = authors.au_id
	GROUP BY authors.au_id
    ORDER BY total DESC;






