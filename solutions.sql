-- Challenge 1
USE publications;

SELECT authors.au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", title AS "TITLE", pub_name AS "PUBLISHER"
	FROM authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN publishers ON titles.pub_id = publishers.pub_id
    ORDER BY authors.au_id ASC;
    
-- check
-- the above query results in 25 rows
SELECT * 
	FROM titleauthor;
-- the above query also results in 25 rows!
    


-- Challenge 2

SELECT authors.au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", pub_name AS "PUBLISHER", count(title) AS "TITLE"
	FROM authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN titles ON titleauthor.title_id = titles.title_id
    JOIN publishers ON titles.pub_id = publishers.pub_id
    GROUP BY authors.au_id, PUBLISHER
    ORDER BY authors.au_id DESC;

-- check
-- the above query results in 24 rows
-- we already saw that the titleauthor table has 25 rows.. this check cannot be right but the data shown is almost identical to the result given.

-- Challenge 3

SELECT authors.au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", sum(qty) as Total
	FROM authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN sales ON titleauthor.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY total DESC
    LIMIT 3;


-- Challenge 4

SELECT authors.au_id as "AUTHOR ID", au_lname AS "LAST NAME", au_fname AS "FIRST NAME", sum(qty) as Total
	FROM authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN sales ON titleauthor.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY total DESC
    LIMIT 23;


