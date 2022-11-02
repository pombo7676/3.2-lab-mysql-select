select AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(*) AS 'TITLE_COUNT'
FROM challenge1
group by  AUTHOR_ID,LAST_NAME,FIRST_NAME, PUBLISHER
order by TITLE_COUNT desc;