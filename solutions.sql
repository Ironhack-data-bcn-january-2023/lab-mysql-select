USE publications;

-- 1
SELECT authors.au_id, au_lname, au_fname, title, publishers.pub_name FROM titles
	JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
    JOIN authors
		ON titleauthor.au_id = authors.au_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id;
        
-- 2
SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(titles.title_id) FROM titles
	JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	JOIN authors
		ON titleauthor.au_id = authors.au_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id
GROUP BY pub_name, authors.au_id
ORDER BY COUNT(title_id) ASC;


17:43:47	SELECT authors.au_id, au_lname, au_fname, pub_name, COUNT(titles.title_id) FROM titles  JOIN titleauthor   ON titles.title_id = titleauthor.title_id  JOIN authors   ON titleauthor.au_id = authors.au_id  JOIN publishers   ON titles.pub_id = publishers.pub_id GROUP BY pub_name ORDER BY COUNT(title_id) ASC LIMIT 0, 50000	Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'publications.authors.au_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.0015 sec


-- 3
SELECT title_id, au_id, au_lname, au_fname, COUNT(ord_num) AS TOTAL FROM titleauthor
	JOIN sales
		ON titleauthor.title_id = sales.title_id
WHERE COUNT(ord_num)
GROUP BY TOTAL ASC
LIMIT 3;

-- 4
SELECT title_id, au_id, au_lname, au_fname, COUNT(ord_num) AS TOTAL FROM titleauthor
	JOIN sales
		ON titleauthor.title_id = sales.title_id
WHERE COUNT(ord_num)
GROUP BY TOTAL;



