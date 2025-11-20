-- Red Bus Travellers Data
-- Create Tables with Column Definitions for the Red Bus Travellers

create table PASSENGER(
    Passenger_id integer,
    Passenger_name text,
    Category text,
    Gender text,
    Boarding_city text,
    Destination_city text,
    Distance integer,
    Bus_Type text,
    primary key(Passenger_id)
);

create table PRICE(
    id integer,
    Bus_Type text,
    Distance integer,
    Price integer,
    primary key(id)
);

-- Insert Data into Newly Created Tables
INSERT INTO PASSENGER VALUES
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2 ,'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad' ,700 ,'Sitting'),
(3 ,'Pallavi', 'AC', 'F' ,'Panaji', 'Bengaluru', 600 ,'Sleeper'),
(4 ,'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

INSERT INTO PRICE VALUES
(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

-- Write an SQL query to count the number of female passengers as "count" who have traveled a minimum distance of 600 KM.
SELECT GENDER, COUNT(GENDER) AS count 
FROM PASSENGER WHERE DISTANCE >= 600 AND GENDER = 'F';

-- Write an SQL query to display the details of passengers who are traveling in a sleeper bus and have a travel distance greater than 500.
select * from passenger where Distance > 500 and Bus_Type = 'Sleeper';

-- Write an SQL query to select the names of passengers whose names start with the letter 'S' from the 'Passenger' table.
select Passenger_name from Passenger 
where passenger_name like 'S%' order by Passenger_name;

-- Write an SQL query to calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output.
select p.Passenger_name,p.Boarding_City,p.Destination_City,p.Bus_Type,pr.Price
from Passenger p left join Price pr 
on p.Distance = pr.Distance and p.Bus_Type = pr.Bus_Type; 

-- Write an SQL query to extract the passenger name(s) and the ticket price for those who traveled 700 KMs Sitting in a bus?
select P.passenger_name, pr.price from passenger p left join price pr
on p.distance = pr.distance and p.Bus_type = pr.Bus_Type
where p.distance = 700 and p.Bus_Type = 'Sitting';

-- Write an SQL query to calculate the bus fare for a passenger named 'Pallavi' traveling from Panaji to Bangalore . 
select p.Distance,p.Passenger_name,pr.Bus_Type,pr.Price 
from passenger p join price pr
on p.distance = pr.distance 
where p.Passenger_name = 'Pallavi';

-- You are working with a travel agency database that stores information about bus bookings. The database has a table named passenger with the following columns: passenger_id, name, bus_type, and category. You need to update the category column to 'Non-AC' for all rows where the bus_type is 'sleeper'.
-- Write an SQL query to update the category column in the passenger table based on the specified condition.
update passenger set category = 'Non-AC' where Bus_type = 'Sleeper';

-- You are working with a database of a travel agency called Red Bus Travellers. Your task is to delete a passenger from the 'passenger' table where the passenger name is 'Piyush'.
-- Write an SQL query to delete the record and commit the change in the database.
Start Transaction;
Delete from passenger where passenger_name = 'Piyush';
Commit;

-- Write an SQL query to truncate the passenger table and comment on the number of rows in the table before and after truncation. 
Delete from Passenger;
-- Above Query delete all the data from passenger table retaining only structure of table.

-- Write an SQL query to delete the table named 'passenger' from the database.
Drop Table Passenger;
-- Deleted table Passenger.