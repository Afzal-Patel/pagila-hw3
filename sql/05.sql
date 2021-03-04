/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT temp1.title FROM
(SELECT title FROM
(SELECT title,unnest(special_features) AS special_feature FROM film) as temp 
WHERE special_feature = 'Behind the Scenes') as temp1
INNER JOIN 
(SELECT title FROM
(SELECT title,unnest(special_features) AS special_feature FROM film) as temp
WHERE special_feature = 'Trailers') as temp2
ON temp2.title=temp1.title
ORDER BY temp1.title;

