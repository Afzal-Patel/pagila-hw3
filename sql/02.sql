/*
 * Count the number of movies that contain each type of special feature.
 */
SELECT ft AS special_features, count(*)
FROM film, unnest(film.special_features) as ft 
GROUP BY ft
ORDER BY ft ASC;
