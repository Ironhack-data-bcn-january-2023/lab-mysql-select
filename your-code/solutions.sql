use publications;

select au_id as author_id, au_lname as last_name, au_fname as first_name, title, pub_name as publisher
	from authors
	join titleauthor
		on authors.au_id = titleauthor.au_id
	join titles
		on titleauthor.title_id = titles.title_id
	join publishers
		on titles.pub_id = publishers.pub_id
	