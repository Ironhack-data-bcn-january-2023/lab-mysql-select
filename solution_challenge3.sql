use publications;
select authors.au_id as 'AUTHOR ID' , authors.au_lname as 'LAST NAME' , authors.au_fname as 'NAME', sum(qty) as 'TOTAL'
from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join sales
on titleauthor.title_id = sales.title_id
group by authors.au_id
order by TOTAL desc
limit 3;






