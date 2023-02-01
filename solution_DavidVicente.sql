USE publications;

-- CHALLENGE 1

SELECT authors.au_id as author_id, authors.au_lname as last_name, authors.au_fname as first_name, titles.title as title, publishers.pub_name AS publisher
from authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
		JOIN publishers ON titles.pub_id = publishers.pub_id;

-- CHALLENGE 2     

SELECT authors.au_id as author_id, authors.au_lname as last_name, authors.au_fname as first_name, publishers.pub_name AS publisher, count(titles.title) as title
from authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
		JOIN publishers ON titles.pub_id = publishers.pub_id
group by authors.au_id , publishers.pub_name;

-- CHALLENGE 3 

SELECT authors.au_id as author_id, authors.au_lname as last_name, authors.au_fname as first_name, count(titles.title) as TOTAL
from authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
		JOIN publishers ON titles.pub_id = publishers.pub_id
group by authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- CHALLENGE 4

SELECT authors.au_id as author_id, authors.au_lname as last_name, authors.au_fname as first_name, count(titles.title) as TOTAL
from authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
	JOIN titles ON titleauthor.title_id = titles.title_id
		JOIN publishers ON titles.pub_id = publishers.pub_id
group by authors.au_id
ORDER BY TOTAL DESC;



   
