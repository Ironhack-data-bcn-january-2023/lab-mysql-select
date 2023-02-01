use publications;

select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", title as "TITLE", pub_name as "PUBLISHER"
	from authors
	join titleauthor
		on authors.au_id = titleauthor.au_id
	join titles
		on titleauthor.title_id = titles.title_id
	join publishers
		on titles.pub_id = publishers.pub_id
    order by authors.au_id;
    
select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", pub_name as "PUBLISHER", count(titles.title) as "COUNT"
	from authors
	join titleauthor
		on authors.au_id = titleauthor.au_id
	join titles
		on titleauthor.title_id = titles.title_id
	join publishers
		on titles.pub_id = publishers.pub_id
	group by authors.au_id, publishers.pub_id
    order by authors.au_id;
    
select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", SUM(qty) as "TOTAL"
	from authors
	join titleauthor
		on authors.au_id = titleauthor.au_id
	join sales
		on titleauthor.title_id = sales.title_id
	group by authors.au_id
    order by TOTAL desc
    limit 3;
    
select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME", au_fname as "FIRST NAME", ifnull(SUM(qty), 0) as "TOTAL"
	from authors
	left join titleauthor
		on authors.au_id = titleauthor.au_id
	left join sales
		on titleauthor.title_id = sales.title_id
	group by authors.au_id
    order by TOTAL desc;