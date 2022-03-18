--1) List all customers who live in Texas (use JOINS).
select customer.first_name, customer.last_name, customer.email, district
from customer
full join address 
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id 
where district = 'Texas';
-- Answer: 5 customers live in Texas


--2) Get all payments above $6.99 with the customer's FULL name.
select first_name, last_name, amount
from customer
left join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;
--Answer: ALOT of people Ryan Salisbury 3 times, Harold Martino and Martin Bales a couple times as well


--3) Show all customers names who have made payments over $175 (use subqueries).
select *
from customer 
where customer_id in (
	select customer_id
	from payment 
	group by customer_id
	having sum(amount) > 175
);
-- Answer: 11 customers who paid over 175


--4) List all customers that live in Nepal (use the city table).
select customer.first_name, customer.last_name, customer.email, city
from customer
full join address 
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
where city = 'Nepal';
--Answer: None

--5) Which staff member had the most transactions?
select staff_id, count(staff_id)
from payment
group by staff_id;
--Answer is staff member two Jon


--6) How many movies of each rating are there?
select rating, count(rating)
from film
group by rating
order by count desc; 
--Answer: There are 223 for PG-13, 210 for NC-17, 195 for R, 194 for PG, 178


--7) Show all customers who have made a single payment above $6.99 (use subqueries).
select store_id, first_name, last_name
FROM customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 6.99
	order by sum(amount) desc
);
--Answer: 598 customers made a single payment above $6.99


--8) How many free rentals did our stores give away?
select customer_id, rental_id
from payment 
group by customer_id, rental_id
having sum(amount) = 0.00
order by sum(amount) desc;
--Answer: Had 23 free rentals

