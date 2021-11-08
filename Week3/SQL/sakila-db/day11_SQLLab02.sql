# Labs | Week3 | DAY 02

## 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor WHERE first_name = 'Scarlett';

# 2.How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT film_id) FROM film;
SELECT COUNT(DISTINCT rental_id) FROM rental;

## 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) as max_duration, MIN(length) as min_duration FROM film;

# 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT substring_index(SEC_TO_TIME(AVG(length)*60), ':', 2) as 'AVG_duration' FROM film;

SELECT avg(length)/60) as 


## 5.How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

# 6.Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) as opperation_days FROM rental;

# 7.Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH(rental_date) as month, WEEKDAY(rental_date) as weekday FROM rental 
LIMIT 20;

# 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
SELECT *,
CASE
when (rental_date) >= 6 then 'weekend'
ELSE 'workday'
END
as 'day_type'
FROM rental
END;


## 9. How many rentals were in the last month of activity?
SELECT MAX(rental_date) from rental;

SELECT COUNT(*) as past_month_rentals FROM rental
WHERE rental_date BETWEEN '2006-01-15' AND '2006-02-15';

SELECT COUNT(*) FROM rental
WHERE rental_date LIKE '2006-02%';

#YA ESTÁ