use publications;
select authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME' , authors.au_fname as 'NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
	from authors 
    join titleauthor
    on authors.au_id = titleauthor.au_id
    LEFT join titles
    on titleauthor.title_id = titles.title_id
    left join publishers
    on titles.pub_id = publishers.pub_id
    order by authors.au_id, titles.title desc;


