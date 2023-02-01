use publications;
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





