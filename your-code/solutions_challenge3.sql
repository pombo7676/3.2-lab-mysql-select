SELECT z.au_id as 'AUTHOR_ID', z.au_lname as 'LAST_NAME', z.au_fname as 'FIRST_NAME', SUM(N_VENTAS) as 'TOTAL'
FROM (
SELECT a.au_id, a.au_lname, a.au_fname, t.title_id, s.N_ventas
FROM authors as a LEFT JOIN titleauthor as ta 
ON ta.au_id = a.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
LEFT JOIN (SELECT title_id, SUM(qty) as N_ventas
FROM SALES
GROUP BY title_id) as s ON ta.title_id = s.title_id
) as z
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;