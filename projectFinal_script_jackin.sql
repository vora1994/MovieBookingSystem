use mydb;

-- stored procedured

-- procedure to show the movie entered is in which theater and what are the show timings with location of the theater 
set sql_safe_updates = 0;

select * from location;
select * from showdetails;
select * from Theater;

Delimiter ^^
Create procedure proc_MovieShowDetails(IN MovieNm varchar(30)) -- pass movie name 
begin
select location.City,theater.TheaterName, showdetails.Show_Date,showdetails.ShowTimings
from location
join theater
on location.LocationID = theater.Location_LocationID
join showdetails
on theater.TheaterID = showdetails.TheaterID
join movie
on showdetails.MovieID= movie.MovieID
where MovieName = MovieNm;

End ^^
delimiter ;

call proc_MovieShowDetails('Titanic');

call proc_MovieShowDetails('Deadpool'); 
--
-- procedure to search for movie , theater and its show timing according to day



Delimiter $$
Create procedure proc_schedule(IN day1 varchar(30)) -- pass day
begin
   SELECT theater.TheaterName,movie.MovieName,ShowTimings
 FROM showdetails 
 join movie
on showdetails.MovieID = movie.MovieID
join theater
on showdetails.TheaterID = theater.TheaterID
 WHERE  dayname(Show_Date) = day1;
end $$
DELIMITER ;

call proc_schedule('Friday');


--
-- procedure to get movie and theatre according to the genre

Delimiter **
Create procedure proc_getMoviesandTheater(IN genre varchar(30)) -- pass Horror, Romance
begin
    select movie.MovieName, theater.TheaterName
from movie inner join theater inner join movieinfo
on movie.MovieID = movieinfo.Movie_MovieID
where Category = genre;
end **
DELIMITER ;

call  proc_getMoviesandTheater('action');
--
-- stored procedured end

-- view

-- view to see every customers order which is succesfull in food and ticket with the total amount spend
create view  vw_TotalCustomerOrder
as
select concat(customer.FirstName," ",customer.LastName) as fullName, ticketOrder.TotalAmount as ticketAmount , foodorder.TotalAmount as foodAmount, 
coalesce((ticketOrder.TotalAmount + foodorder.TotalAmount),foodorder.TotalAmount, ticketOrder.TotalAmount ) as TotalAmount
from customer
 join ticketOrder
on customer.CustomerID = ticketOrder.Customer_CustomerID
 left join foodorder
on customer.CustomerID = foodorder.Customer_CustomerID
where ticketorder.OrderSuccess = 'Y'
order by FirstName,LastName;

select * from vw_TotalCustomerOrder;
--
-- view to see theater which movie it has in which screen and how many seats are remaining in it
create view vw_currentShow
as 
select theater.TheaterName,movie.MovieName,screen.ScreenNumber,screen.TotalNoOfSeats
from theater join theater_has_movies
on theater.TheaterID = theater_has_movies.Theater_TheaterID
join movie
on movie.MovieID = theater_has_movies.Movie_MovieID
join screen on theater.TheaterID = screen.Theater_TheaterID
group by TheaterName,MovieName,ScreenNumber ;

select * from vw_currentShow
where TheaterName = 'Amc';

--
-- view to see  what movies and concession are provided by a theater

create view vw_theaterinfo
as
select theater.TheaterName,location.city,movie.MovieName,ConcessionOffers.FoodName
from theater join location
on theater.Location_locationID = location.LocationID
join theater_has_movies
on Theater.TheaterID = theater_has_movies.Theater_TheaterID
join movie
on movie.MovieID = theater_has_movies.Movie_MovieID
join ConcessionOffers
on  theater.TheaterID = ConcessionOffers.Theater_TheaterID
order by theatername;

select * from vw_theaterinfo;
--
-- view end

-- triggers

--  update trigger to set the old price of seat into new table

delimiter **
create trigger changeinprice
before update on seat
for each row
begin
insert into seat_old
set SeatNumber = OLD.seatNumber,
TypeOFSeat = OLD.TypeOfSeat,
PriceOFSeat = OLD.priceOfSeat,
ScreenNumber = OLD.Screen_ScreenNumber;

end **
delimiter ;

select * from seat;
select * from seat_old;
--

update mydb.Seat
set PriceOFSeat =  20
where SeatNumber = '1B';
--

-- delete trigger to keep track of discontinued movies into a new table

delimiter //
create trigger movie_log
before delete on movie
for each row
begin
insert into discontinuedmovies
set MovieId = OLD.MovieID,
MovieName = OLD.MovieName,
Ratings = OLD.Ratings;
end //
delimiter ;

delete from movie
where MovieID = 6;

select * from discontinuedmovies;
select * from movie;


insert into movie values (7, 'batman begins',4);
insert into movie values (8 , 'Gravity', 3);


-- triggers end

-- transaction 

set autocommit = 0;

start transaction;
--
update mydb.ticketOrder
set OrderSuccess = 'Y'
where OrderID = 3;

savepoint order_success1;

update mydb.ticketOrder
set OrderSuccess ='Y'
where OrderID = 5;

rollback to savepoint order_success1;

commit;

set autocommit = 1;

-- transaction end

