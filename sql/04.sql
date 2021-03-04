/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */


SELECT DISTINCT(first_name || ' ' || last_name) AS "Actor Name" 
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
WHERE film_id IN
(SELECT film_id FROM
(SELECT film_id,unnest(special_features) AS special_feature FROM film) as temp 
WHERE special_feature = 'Behind the Scenes')
ORDER BY first_name || ' ' || last_name;
