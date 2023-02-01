use publications;
select authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME' , authors.au_fname as 'NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
	from authors 
    join titleauthor
		on authors.au_id = titleauthor.au_id
    LEFT join titles
		on titleauthor.title_id = titles.title_id
    left join publishers
		on titles.pub_id = publishers.pub_id;

select authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME' , authors.au_fname as 'NAME', publishers.pub_name as 'PUBLISHER', count(distinct titles.title) as 'TITLE COUNT'
	from authors 
    join titleauthor
		on authors.au_id = titleauthor.au_id
    LEFT join titles
		on titleauthor.title_id = titles.title_id
    left join publishers
		on titles.pub_id = publishers.pub_id
    group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
    order by authors.au_id desc;
    
select authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME' , authors.au_fname as 'NAME', sum(qty) as 'TOTAL'
	from authors
	join titleauthor
		on authors.au_id = titleauthor.au_id
	join sales
		on titleauthor.title_id = sales.title_id
	group by authors.au_id
	order by TOTAL desc
	limit 3;
    
select authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME' , authors.au_fname as 'NAME', sum(coalesce(sales.qty,0)) as 'TOTAL'
	from authors
	left join titleauthor
		on authors.au_id = titleauthor.au_id
	left join sales
		on titleauthor.title_id = sales.title_id
	group by authors.au_id
	order by TOTAL desc;

