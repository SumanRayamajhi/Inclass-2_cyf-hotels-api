drop table if exists customers;
drop table if exists hotels;
drop table if exists bookings;

CREATE TABLE customers (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(30) NOT NULL,
  email    VARCHAR(120) NOT NULL,
  address  VARCHAR(120),
  city     VARCHAR(30),
  postcode VARCHAR(12),
  country  VARCHAR(20)
);

CREATE TABLE hotels (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(120) NOT NULL,
  rooms    INT NOT NULL,
  postcode VARCHAR(10)
);

CREATE TABLE bookings (
  id            SERIAL PRIMARY KEY,
  customer_id   INT REFERENCES customers(id),
  hotel_id      INT REFERENCES hotels(id),
  checkin_date  DATE NOT NULL,
  nights        INT NOT NULL
);

INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Sue Jones','s.jones1234@gmail.com','120 Old Street','London','N10 3CD','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Alice Evans','alice.evans001@hotmail.com','3 High Road','Manchester','m13 4ef','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Mohammed Trungpa','mo.trungpa@hotmail.com','25 Blue Road','Manchester','M25 6GH','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Steven King','steve.king123@hotmail.com','19 Bed Street','Newtown', 'xy2 3ac','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Nadia Sethuraman','nadia.sethuraman@mail.com','135 Green Street','Manchester','M10 4BG','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Melinda Marsh','mel.marsh-123@gmail.com','7 Preston Road','Oldham','OL3 5XZ','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Martín Sommer','martin.sommer@dfgg.net','C/ Romero, 33','Madrid','28016','Spain');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Laurence Lebihan','laurence.lebihan@xmzx.net','12, rue des Bouchers','Marseille','13008','France');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Keith Stewart','keith.stewart@gmail.com','84 Town Lane','Tadworth','td5 7ng','UK');


INSERT INTO hotels (name, rooms, postcode) VALUES ('Golden Cavern Resort', 10, 'L10ABC');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Elder Lake Hotel', 5, 'L10ABC');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Pleasant Mountain Hotel', 7, 'ABCDE1');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Azure Crown Resort & Spa', 18, 'DGQ127');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Jade Peaks Hotel', 4, 'DGQ127');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Elegant Resort', 14, 'DGQ127');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Cozy Hotel', 20, 'AYD189');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Snowy Echo Motel', 15, 'AYD189');

INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-10-01', 2);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-12-10', 6);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 3, '2019-07-20', 4);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (2, 3, '2020-03-10', 4);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (2, 5, '2020-04-01', 1);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (3, 1, '2019-11-01', 1);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (3, 2, '2019-11-23', 2);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (4, 8, '2019-12-23', 3);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (4, 2, '2019-09-16', 5);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (6, 5, '2019-09-14', 2);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (6, 6, '2020-01-14', 5);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (8, 4, '2020-02-01', 3);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (8, 5, '2020-01-03', 7);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (8, 8, '2019-12-25', 4);


--Exercise 1
--Add a column date_of_birth of type DATE in the customers table.
ALTER TABLE customers ADD COLUMN date_of_birth DATE;
select * from customers;

--Rename the column date_of_birth to birthdate in the customers table.
alter table customers rename column date_of_birth to birthdate
select * from customers;

--Delete the column birthdate from the customers table
alter table customers drop birthdate

--Exercise 2
--Create a new table test
CREATE TABLE test (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(30) NOT NULL,
  email    VARCHAR(120) NOT NULL,
  address  VARCHAR(120),
  city     VARCHAR(30),
  postcode VARCHAR(12),
  country  VARCHAR(20)
);

INSERT INTO test (name, email, address, city, postcode, country) VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');
INSERT INTO test (name, email, address, city, postcode, country) VALUES ('Sue Jones','s.jones1234@gmail.com','120 Old Street','London','N10 3CD','UK');
INSERT INTO test (name, email, address, city, postcode, country) VALUES ('Alice Evans','alice.evans001@hotmail.com','3 High Road','Manchester','m13 4ef','UK');

select * from test

--Drop the table test
drop table test 
select * from test

--Exercise 3

UPDATE customers SET name='Bob Marley', country='Jamaica' WHERE id=3;
select * from customers 
SELECT * FROM customers ORDER BY id;

--Update the postcode of the hotel named Elder Lake Hotel to L10XYZ
update hotels set postcode='L10XYZ' where name='Elder Lake Hotel';
select * from hotels where name='Elder Lake Hotel';

--Update the number of rooms of Cozy Hotel to 25
update hotels set rooms=25 where name='Cozy Hotel'
select * from hotels where name='Cozy Hotel'

--For the customer named Nadia Sethuraman, update her address to 2 Blue Street, 
--her city to Glasgow and her postcode to G11ABC in one query
select address, city, postcode from customers where name='Nadia Sethuraman'
update customers set address='2 Blue Street', city='Glasgow', postcode='G11ABC' where name='Nadia Sethuraman'

--Update all the bookings of customer with ID 1 for the hotel with ID 1 to 5 nights in one query
update bookings set nights=5 where customer_id=1 
select * from bookings where customer_id=1

--Exercise 4
--Delete the booking of customer ID 8 for the date 2020-01-03
select * from bookings where customer_id=8
DELETE FROM bookings WHERE customer_id=8 and checkin_date ='2020-01-02';

--Delete all the bookings of customer ID 6
select * from bookings where customer_id = 6
delete from bookings where customer_id = 6

--Delete the customer with ID 6
select * from customers where id=6
delete from customers where id=6

--Exercise 5
--Retrieve all the bookings along with customer data for bookings starting in 2020
select * from bookings b 
inner join customers c on c.id=b.customer_id 
where b.checkin_date >= '2020-01-01'

--Retrieve the customer names, booking start dates and number of nights for all 
--customers who booked the hotel name Jade Peaks Hotel
select c.name, b.checkin_date, b.nights from bookings b 
inner join customers c on c.id=b.customer_id 
inner join hotels h on h.id=b.hotel_id 
where h.name='Jade Peaks Hotel'

--Retrieve all the booking start dates with customer names and hotel names for all 
--bookings for more than 5 nights
select b.checkin_date, c.name, h.name from bookings b 
inner join customers c on c.id=b.customer_id 
inner join hotels h on h.id=b.hotel_id 
where nights > 5

SELECT * FROM customers ORDER BY id;
select * from hotels h order by "name" 
SELECT * FROM bookings ORDER BY checkin_date DESC;
SELECT * FROM customers LIMIT 10;
SELECT * FROM customers WHERE id IN (1,2,3,4);
SELECT * FROM customers WHERE name LIKE 'Joh%';

SELECT bookings.checkin_date,customers.name,hotels.name FROM bookings
INNER JOIN customers ON customers.id=bookings.customer_id
INNER JOIN hotels ON hotels.id=bookings.hotel_id
WHERE customers.name LIKE 'M%'
ORDER BY hotels.name
LIMIT 3;

--Exercise 6
--Retrieve all customers whose name starts with the letter S
select * from customers c where name like 'S%' 

--Retrieve all hotels which have the word Hotel in their name
select * from hotels where name like '% Hotel'

--Retrieve the booking start date, customer name, hotel name for 
--the top 5 bookings ordered by number of nights in descending order
select b.checkin_date, c.name, h.name from bookings b 
inner join customers c on c.id=b.customer_id 
inner join hotels h on h.id=b.hotel_id 
order by b.nights desc 
limit 5