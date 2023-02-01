USE publications;

-- CHALLENGE 1
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name from publications.authors as a
	JOIN titleauthor as ta
		on a.au_id = ta.au_id 
	JOIN titles as t
		on ta.title_id = t.title_id
	JOIN publishers as p
		on t.pub_id = p.pub_id;

-- CHALLENGE 2
SELECT 
	a.au_id as author_id,
	a.au_lname as last_name,
	a.au_fname as first_name,
	p.pub_name,
    COUNT(t.title) as TITLE_COUNT
from publications.authors as a
	JOIN titleauthor as ta
		on a.au_id = ta.au_id 
	JOIN titles as t
		on ta.title_id = t.title_id
	JOIN publishers as p
		on t.pub_id = p.pub_id
	GROUP BY 1,2,3,4
    ORDER BY COUNT(t.title) DESC;
    
-- CHALLENGE 3
SELECT 
	a.au_id as author_id,
	a.au_lname as last_name,
	a.au_fname as first_name,
    SUM(s.qty) as Total
from publications.authors as a
	JOIN titleauthor as ta
		on a.au_id = ta.au_id 
	JOIN titles as t
		on ta.title_id = t.title_id
	JOIN publications.sales as s
		on t.title_id = s.title_id
	GROUP BY 1,2,3
    ORDER BY COUNT(t.title) DESC
    LIMIT 3;
    
-- CHALLENGE 4
SELECT 
	a.au_id as author_id,
	a.au_lname as last_name,
	a.au_fname as first_name,
    SUM(
    CASE WHEN 
    s.qty is NULL
    THEN 0
    ELSE s.qty
    END
    ) as Total
from publications.authors as a
	JOIN titleauthor as ta
		on a.au_id = ta.au_id 
	JOIN titles as t
		on ta.title_id = t.title_id
	JOIN publications.sales as s
		on t.title_id = s.title_id
	GROUP BY 1,2,3
    ORDER BY TOTAL DESC;

-- ANOTHER WAY TO DO CHALLENGE 3/4
SELECT 
	a.au_id as author_id,
	a.au_lname as last_name,
	a.au_fname as first_name,
    SUM(s.qty) as Total
from publications.authors as a
	LEFT JOIN publications.titleauthor as ta
		on a.au_id = ta.au_id 
	LEFT JOIN publications.sales as s
		on ta.title_id = s.title_id
	
	GROUP BY 1,2,3
    ORDER BY SUM(s.qty) DESC
    LIMIT 3;
    
-- and now challenge 4...again
    SELECT 
	a.au_id as author_id,
	a.au_lname as last_name,
	a.au_fname as first_name,
    COALESCE(SUM(s.qty),0) as Total
from publications.authors as a
	LEFT JOIN publications.titleauthor as ta
		on a.au_id = ta.au_id 
	LEFT JOIN publications.sales as s
		on ta.title_id = s.title_id
	
	GROUP BY 1,2,3
    ORDER BY SUM(s.qty) DESC;
    