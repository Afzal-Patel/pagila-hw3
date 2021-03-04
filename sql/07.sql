/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */


SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
WHERE film.title IN
    (SELECT title from film
    JOIN film_actor USING (film_id)
    WHERE actor_id IN(
        SELECT DISTINCT(a2.actor_id)
        FROM actor a1
        JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
        JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
        JOIN actor a2 ON fa2.actor_id = a2.actor_id
        WHERE a1.actor_id = 112 
        AND a2.actor_id != 112))
AND actor_id NOT IN
    (SELECT DISTINCT(a2.actor_id)
    FROM actor a1
    JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    JOIN actor a2 ON fa2.actor_id = a2.actor_id
    WHERE a1.actor_id = 112)
ORDER BY "Actor Name";





