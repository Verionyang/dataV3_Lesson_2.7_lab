USE sakila;
-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.
SELECT fc.category_id, count(f.title) as film_count
FROM film as f
LEFT JOIN film_category as fc
ON 
f.film_id = fc.film_id
GROUP BY category_id
ORDER BY category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM staff;
SELECT * FROM rental;
SELECT s.staff_id, count(r.rental_id) as 'Number of total rentals' FROM rental as r
LEFT JOIN staff as s
ON s.staff_id = r.staff_id
WHERE rental_date BETWEEN '2005-01-01' AND '2005-12-31'
GROUP BY r.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT * FROM film;
SELECT count(*) FROM film_actor;
SELECT count(*) FROM actor;
SELECT a.first_name,a.last_name,count(a.actor_id) as 'Number of apperances in the film' FROM actor as a 
LEFT JOIN film_actor as fa
ON a.actor_id = fa.actor_id
GROUP BY a.first_name,a.last_name
ORDER BY count(a.actor_id) DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM customer;
SELECT * FROM rental;
SELECT c.first_name, c.last_name, count(r.rental_id) as 'Number of film rentals' FROM customer as c
JOIN rental as r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY 'Number of film rentals' DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM staff;
SELECT * FROM address;
SELECT s.first_name, s.last_name, a.address FROM staff as s
LEFT JOIN address as a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, count(fa.actor_id) as 'Number of actors' FROM film_actor as fa
JOIN film as f
ON fa.film_id = f.film_id
GROUP BY fa.film_id;

-- 7. Using the tables payment and customer and the JOIN command, 
-- list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, sum(p.amount) as 'Total Payment' FROM payment as p
LEFT JOIN customer as c
ON c.customer_id = p.customer_id 
GROUP BY c.first_name, c.last_name
ORDER BY last_name;

-- 8. List number of films per category
SELECT c.name, count(f.title) as film_count
FROM film as f
LEFT JOIN film_category as fc
ON 
f.film_id = fc.film_id
JOIN category as c
ON
c.category_id = fc.category_id
GROUP BY fc.category_id
ORDER BY fc.category_id;