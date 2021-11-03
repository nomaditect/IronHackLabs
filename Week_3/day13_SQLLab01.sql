 # Labs | Week3 | DAY 03
 
 # 1.Get release years.
 SELECT distinct title,release_year from film
 ORDER BY release_year;
 
 # 2. Get all films with ARMAGEDDON in the title.
 select * from film where title LIKE '%ARMAGEDDON%';
 
 # 3. Get all films which title ends with APOLLO.
 select * from film where title regexp '^APOLLO';
 
 # 4. Get 10 the longest films.
select distinct length,title from film
ORDER BY length DESC
LIMIT 10;
 
 # 5. How many films include Behind the Scenes content?
select count(*) from film where special_features REGEXP 'Behind the Scenes';
 
 # 6. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;
 
 # 7. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
	#INSERT INTO staff (first_name,last_name) VALUES ('TAMMY','SANDERS'); 
select customer_id from customer
where first_name = 'TAMMY' and last_name = 'SANDERS';

SHOW COLUMNS from sakila.staff;

INSERT INTO staff (first_name, last_name, address_id, active , username, email, store_id, last_update)
			select first_name, last_name ,address_id, active, first_name, email, 2, last_update
from sakila.customer
where first_name = 'TAMMY' and last_name = 'SANDERS';



	# 8.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
#You can use current date for the rental_date column in the rental table. 
#Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
	#To get that you can use the following query:
select customer_id from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';    
    
SHOW COLUMNS from sakila.rental;
select customer_id from sakila.customer
where first_name = ‘CHARLOTTE’ and last_name = ‘HUNTER’;
select current_date from sakila.rental;
select rental_id from sakila.rental;
select inventory_id from sakila.rental;
select inventory_id from sakila.rental;
select staff_id from sakila.rental;
select MAX(rental_id) from sakila.rental;
insert into rental (rental_id, rental_date, inventory_id, customer_id, staff_id)
values (‘16050’, ‘20211103’,‘367’,‘130’,‘1’);

 # 9. Delete non-active users, but first, create a 
 # backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. 
	# Follow these steps:
		
	# Check if there are any non-active users
select customer_id from customer
where active = 0;

	# Create a table backup table as suggested
CREATE TABLE removed_users(
customer_id INT AUTO_INCREMENT NOT NULL,
email VARCHAR(40), 
date_removed TIMESTAMP,
PRIMARY KEY (customer_id)
);

DROP TABLE IF EXISTS sakila.removed_users;

	# Insert the non active users in the table backup table
CREATE TABLE removed_users LIKE customer;

INSERT removed_users SELECT * FROM customer
WHERE active=0;
        
	# Delete the non active users from the table customer
DELETE FROM customer
WHERE active= 0; 
 
#disable the foreign key check 
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;

#reenable the foreign key check
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS=1;
 