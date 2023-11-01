create table customer
(  customer_id int Primary key,
   first_name varchar(10),
   last_name varchar(10),
   email varchar(25),
   address varchar(50),
   city varchar(15),
   state varchar(10),
   zip int
)

Insert into customer 
Values
(10, 'Kaustav', 'Dey', 'imkd2019@gmail.com' , 'Siliguri , Shaktigarh' , 'Siliguri' , 'W.B', 734005),
(20,'Debjit','Dutta','debjitnunku@gmail.com','Bonkers , Birbhum','Birbhum','W.B',736005),
(30,'Peterson','Jordan','JordanPete@gmail.com','DumDum , Kolkata','Kolkata','W.B',730005),
(40,'Avi','Paul','hero@gmail.com','Kachrapra , Kolkata','Kolkata','W.B',738005),
(50,'Godfrey','Elden Lord','firsteldenlord@gmail.com','San Jose California','San Jose','U.S.A',12345)

create table Orders
( order_id int Primary key,
  order_date date,
  amount decimal(10,2),
  customer_id int references customer(customer_id)
)

Insert into  Orders
Values
(1,'10-Mar-2023',2299, 10),
(2,'26-Aug-2023',2050,20),
(3,'12-Sep-2023',1499,30),
(4,'17-Sep-2023',2499,40),
(5,'27-Sep-2023',1999,50)



--1.Create a view named ‘customer_san_jose’ which comprises of onlythosecustomers who are from San Jose

create view Customer_View
AS
select * from customer 
where city='San Jose'

select * from Customer_View

--2. Inside a transaction, update the first name of the customer to Franciswhere the last name is Jordan:
-- a. Rollback the transaction
 begin transaction 
 save transaction temp
 update customer
 set first_name='Francis' 
 where last_name='Jordan'

select * from Customer

rollback transaction temp

select * from Customer

--b. Set the first name of customer to Alex, where the last nameisJordan
begin transaction 
update customer
set first_name='Alex'
where last_name='Jordan'
commit
select * from Customer

rollback transaction 

--3. Inside a TRY... CATCH block, divide 100 with 0, print the default error

begin transaction division
begin try 
select (100/0) As Dividing
end try 
begin catch 
select ERROR_MESSAGE() as Error
end catch 

--4. Create a transaction to insert a new record to Orders table and saveit.
begin transaction 
insert into orders ( order_id ,order_date,amount)
Values(6,'09-10-2023',5499)
commit
select * from orders 