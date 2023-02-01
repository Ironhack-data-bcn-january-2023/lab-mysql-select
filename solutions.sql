
USE publications;

-- CHALLENGE 1
SELECT authors.au_id AS "Author ID", 
		authors.au_lname AS "Last Name", 
		authors.au_fname AS "First Name", 
        titles.title AS "Title",
        publishers.pub_name AS "Publisher"
FROM authors
	JOIN titleauthor
		ON authors.au_id = titleauthor.au_id 
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id;
-- CHALLENGE 2
SELECT authors.au_id AS "Author ID", 
		au_lname AS "Last Name", 
		au_fname AS "First Name",
        publishers.pub_name AS "Publisher",
        COUNT(titles.title) AS "Title Count"          
FROM publications.authors
	JOIN titleauthor
		ON authors.au_id = titleauthor.au_id 
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		on titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id, au_lname, au_fname,publishers.pub_name
    ORDER BY COUNT(titles.title) DESC;

-- CHALLENGE 3
SELECT 
		authors.au_id AS "Author ID", 
		au_lname AS "Last Name", 
		au_fname AS "First Name",
		SUM(sales.qty) AS "Total"
FROM authors
	JOIN titleauthor 
		ON authors.au_id = titleauthor.au_id 
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN sales
		ON titles.title_id = sales.title_id
	GROUP BY authors.au_id, au_lname, au_fname
    ORDER BY COUNT(titles.title) DESC
    LIMIT 3;
    
-- CHALLENGE 4
SELECT 
	authors.au_id AS "Author ID",
	authors.au_id AS "Last Name",
	authors.au_fname AS "First Name",
    SUM(sales.qty) AS "Total"
FROM authors
	JOIN titleauthor
		ON authors.au_id = titleauthor.au_id 
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publications.sales
		ON titles.title_id = sales.title_id
	GROUP BY authors.au_id, authors.au_id, authors.au_fname
    ORDER BY "Total" DESC;