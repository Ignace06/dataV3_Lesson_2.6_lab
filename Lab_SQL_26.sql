use sakila;

-- In the table actor, which are the actors whose last names are not repeated?

select  last_name, count(last_name) as Nb_repitition from actor
group by last_name
having Nb_repitition < 2 ;

-- Which last names appear more than once?
select  last_name, count(last_name) as Nb_repitition from actor
group by last_name
having Nb_repitition > 1; 

-- Using the rental table, find out how many rentals were processed by each employee.
select s.first_name as employee, count(rental_id) as rentals from rental as r
join staff as s
on s.staff_id = r.staff_id 
group by employee
order by rentals desc;

-- Using the film table, find out how many films were released each year.
select release_year as Year, count(film_id) as Nb_film from film
group by Year;

-- Using the film table, find out for each rating how many films were there.
select rating, count(film_id) as Nb_film from film
group by rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length), 2) as Avg_length from film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length), 2) as Avg_length from film
group by rating
having Avg_length > 120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title, length, rank()over(order by length desc) as rank_length   from film
order by length desc


