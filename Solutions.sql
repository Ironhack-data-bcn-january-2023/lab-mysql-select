USE publications;
-- query that joins various tables to figure out what titles each author has published at which publishers

-- WHO HAVE PUBLISHED WHAT AT WHERE?
SELECT authors.au_id, au_fname, au_lname, title, pub_name as publisher
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id;
        
        
-- WHO HAVE PUBLISHED HOW MANY AT WHERE?
SELECT authors.au_id, au_fname, au_lname, pub_name as publisher, COUNT(title) as title_count
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id, publishers.pub_id
    ORDER BY authors.au_id DESC;
    
    
   -- WHO ARE THE TOP 3 AUTHORS WHO HAVE SOLD THE HIGHEST NUMBER OF TITLES? 
  SELECT authors.au_id, au_fname, au_lname, SUM(qty) as 'Total'
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	JOIN sales
		ON titleauthor.title_id = sales.title_id
	GROUP BY authors.au_id
	ORDER BY total DESC
	LIMIT 3;
    
    -- The output will display all 23 authors instead of the top 3
    -- Note that the authors who have sold 0 titles should also appear in your output 
    -- (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.
    
	SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(qty),0) as 'TOTAL'
		FROM authors
			LEFT JOIN titleauthor
			ON authors.au_id = titleauthor.au_id
			LEFT JOIN sales
			ON titleauthor.title_id = sales.title_id
	GROUP BY authors.au_id
	ORDER BY TOTAL DESC;
    
    

    

	

