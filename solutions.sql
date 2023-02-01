USE publications;
    
-- Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(titles.title) as "TITLE COUNT"
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id, publishers.pub_name
    ORDER BY "TITLE COUNT" DESC;

-- Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.

	
