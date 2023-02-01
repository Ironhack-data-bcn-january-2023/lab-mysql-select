/*
    Challenge 1 - Who Have Published What At Where?
    
    AUTHOR ID - the ID of the author
    LAST NAME - author last name
    FIRST NAME - author first name
    TITLE - name of the published title
    PUBLISHER - name of the publisher where the title was published
*/
 
SELECT 
	a.au_id as autor_id, 
	a.au_lname as author_last_name, 
	a.au_fname as author_first_name , 
	t.title, 
	p.pub_name
FROM publications.authors as a
JOIN publications.titleauthor ta
	ON a.au_id = ta.au_id
JOIN  publications.titles as t
	ON ta.title_id = t.title_id
JOIN  publications.publishers as p
	ON t.pub_id = p.pub_id;
    
    -- 2
    
    
    
SELECT 
	a.au_id as autor_id, 
	a.au_lname as author_last_name, 
	a.au_fname as author_first_name , 
	p.pub_name,
    COUNT(t.title) as TITLE_COUNT
FROM publications.authors as a
JOIN publications.titleauthor ta
	ON a.au_id = ta.au_id
JOIN  publications.titles as t
	ON ta.title_id = t.title_id
JOIN  publications.publishers as p
	ON t.pub_id = p.pub_id
GROUP BY 1,2,3,4
ORDER BY COUNT(t.title) DESC
;

    -- 3
    
    
    
SELECT 
	a.au_id as autor_id, 
	a.au_lname as author_last_name, 
	a.au_fname as author_first_name , 
    SUM(s.qty) as TOTAL
FROM publications.authors as a
LEFT JOIN publications.titleauthor ta
	ON a.au_id = ta.au_id
LEFT JOIN publications.sales as s
	ON ta.title_id = s.title_id
GROUP BY 1,2,3
ORDER BY SUM(s.qty) DESC
LIMIT 3
;
        
   -- 4
    
SELECT 
	a.au_id as autor_id, 
	a.au_lname as author_last_name, 
	a.au_fname as author_first_name , 
    COALESCE(SUM(s.qty),0) as TOTAL
FROM publications.authors as a
LEFT JOIN publications.titleauthor ta
	ON a.au_id = ta.au_id
LEFT JOIN publications.sales as s
	ON ta.title_id = s.title_id
GROUP BY 1,2,3
ORDER BY SUM(s.qty) DESC

;
    