use airline_company;

delimiter  $$
create definer=`root`@`localhost` procedure insert_flight ( in FlightID int(11), in Duration int(5), in Date date, in Departure_moment datetime, in Arrival_moment datetime,
															in Departure_gate varchar(45), in Arrival_gate varchar(45), in AirplaneID int(11), in Departure_AirportID int (11),
															in Arrival_AirportID int (11), in Status tinyint(1))
begin
insert into flight values(FlightID,Duration,Date,Departure_moment,Arrival_moment,Departure_gate,Arrival_gate,AirplaneID,Departure_AirportID,Arrival_AirportID,Status);

end $$
delimiter ;


delimiter $$
create definer=`root`@`localhost` procedure insert_employee ( in EmpID bigint(11), in Name varchar(30), in Surname varchar(40), in Address varchar(45), in Birth_date date,
																		in Birth_place varchar(30), in Email varchar(32), in Tel varchar(30), in Duty tinyint(1),
																		in Bank_account_number varchar(20), in Salary decimal(10,3), in BranchID int(11))

begin
insert into employee values (EmpID,Name,Surname,Address,Birth_date,Birth_place,Email,Tel,Duty,Bank_account_number,Salary,BranchID);

end $$
delimiter ;

delimiter $$
create definer=`root`@`localhost` procedure insert_ticket ( in TicketID int(11), in Price decimal(10,3), in Class varchar(45), in Seat varchar(45), in FlightID int(11), in PassengerPID int (11),
															in Name varchar(45), in Surname varchar(45), in Date_of_birth date, in Address varchar(45), in Passport_number varchar(20), in State_Zip int(11)
															)
begin
insert into ticket values(TicketID,Price,Class,Seat,FlightID,PassengerPID);
insert into passenger values(PassengerPID,Name,Surname,Date_of_birth,Address,Passport_number,State_Zip);
end $$
delimiter ;

delimiter $$
create definer=`root`@`localhost` procedure modify_flight (in id int(11),  in Date date,in Duration int(5), in Departure_moment datetime,
															 in AirplaneID int(11))
begin
update flight set Duration = Duration where FlightID=id;
update flight set Date=Date  where FlightID = id;
update flight set Departure_moment = Departure_moment where FlightID = id;
update flight set AirplaneID=AirplaneID  where FlightID = id;

end $$
delimiter ;

delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE delete_flight(in id int(11))
Begin
delete from flight where FlightID= id;
delete from flight_has_employee where FlightID = id;
delete from flight_has_passenger where FlightID = id;
delete from reservation where FlightID=id;
delete from ticket where FlightID=id;
delete from ticket_purchase where FlightID=id;
end$$
delimiter ;

delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE delete_ticket(in id int(11))
Begin
delete from ticket where TicketID= id;
delete from ticket_purchase where ticket_TicketID=id;
end $$
delimiter ;

create view flight_view as
select z.FlightID, z.Duration, z.Date, z.Departure_AirportID, z.Arrival_AirportID, z.Departure_moment, z.Arrival_moment, 
z.AirplaneID, z.Status, r.EmployeeID from flight z natural join flight_has_employee r  
where z.FlightID=r.FlightID
with check option;


create view flight_view_with_stewart as
select z.FlightID, z.Duration, z.Date, z.Departure_AirportID, z.Arrival_AirportID, z.Departure_moment, z.Arrival_moment, 
z.AirplaneID, z.Status, r.Name, r.Surname from flight_view z natural join employee r  
where z.EmployeeID=r.EmpID and r.Duty=2
with check option;

create view flight_table as
select z.FlightID, z.Duration, z.Date, z.Departure_AirportID, z.Arrival_AirportID, z.Departure_moment, z.Arrival_moment, 
z.AirplaneID, z.Status, z.Name1, z.Surname1, r.Name, r.Surname from flight_view_with_employee z natural join flight_view_with_stewart r  
where z.FlightID=r.FlightID
with check option;


		
create view employee_table as
select z.EmpID, z.Name1, z.Surname, z.Address, z.Birth_date, z.Birth_place, z.Email, 
z.Tel, z.Duty, z.Bank_account_number, z.Salary , r.Name from employee_info z natural join branch r  
where z.BranchID=r.BranchID
with check option;

create view passenger_info as
select z.Name, z.Surname, z.PassengerPID, z.Passport_number from passenger z   
with check option;

create view ticket_info as
select z.TicketID, z.Class, z.Seat, r.Departure_moment, r.Departure_AirportID,r.Arrival_AirportID ,z.Price, z.FlightID from ticket z inner join flight_table r
where z.FlightID=r.FlightID
with check option;

create view pass_bank_account as
select z.Name,z.Surname,z.PassengerPID,z.Passport_number, r.Passenger_bank_account_number from passenger z inner join passenger_bank_account r
where z.PassengerPID=r.PassengerPID
with check option;

create view table1 as
select z.Name,z.Surname,z.PassengerPID,z.Passport_number,r.FlightID, z.Passenger_bank_account_number from pass_bank_account z inner join flight_has_passenger r
where z.PassengerPID=r.PassengerID
with check option;

create view ticket_table as
select z.TicketID,r.Name ,r.Surname,r.PassengerPID,r.Passport_number,z.Class, z.Seat, z.Departure_moment, z.Departure_AirportID, z.Arrival_AirportID, r.Passenger_bank_account_number,z.Price from ticket_info z inner join table1 r
where z.FlightID=r.FlightID
with check option;


delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE delete_employee(in id bigint(11))
Begin
delete from employee where EmpID = id;
delete from flight_has_employee where EmployeeID = id;
delete from airport_has_employee where Employee_EmpID = id;
end$$
delimiter ;



/*
DELIMITER $$

CREATE TRIGGER update_balance_for_company3
    AFTER INSERT 
    ON ticket_purchase FOR EACH ROW
BEGIN
	declare pcijena decimal(10,3);
    
    
	select Price
    into pcijena
	from ticket
    where NEW.FlightID = FlightID
    group by FlightID;
    
    
    update branch_bank_account
    set Account_balance = Account_balance + pcijena
	where Branch_bank_account_number=new.Branch_bank_account_number;
    
END$$    

DELIMITER ;


 


DELIMITER $$

CREATE TRIGGER update_balance_for_passenger
    BEFORE INSERT 
    ON ticket_purchase FOR EACH ROW
BEGIN
	declare pcijena decimal(10,3);
    declare stanje decimal(10,3);
    
    
	select Price
    into pcijena
	from ticket
    where NEW.FlightID = FlightID
    group by FlightID;
    
    select Account_balance
    into stanje
	from passenger_bank_account
    where NEW.PassengerPID = PassengerPID
    group by PassengerPID;
    
    
    if ( stanje > pcijena) then
    update passenger_bank_account
    set Account_balance = Account_balance - pcijena
	where PassengerPID=new.PassengerPID;
    end if;
END$$    

DELIMITER ;

*/


DELIMITER $$

CREATE TRIGGER ticket_purchase
    BEFORE INSERT 
    ON ticket_purchase FOR EACH ROW
BEGIN
	declare pcijena decimal(10,3);
    declare stanje decimal(10,3);
    declare bstanje decimal(10,3);
    
    
	select Price
    into pcijena
	from ticket
    where NEW.FlightID = FlightID
    group by FlightID;
    
    select Account_balance
    into stanje
	from passenger_bank_account
    where NEW.PassengerPID = PassengerPID
    group by PassengerPID;
    
    
    if ( stanje > pcijena) then
    update passenger_bank_account
    set Account_balance = Account_balance - pcijena
	where PassengerPID=new.PassengerPID;
    
    update branch_bank_account
    set Account_balance = Account_balance + pcijena
	where Branch_bank_account_number=new.Branch_bank_account_number;
    end if;
END$$    

DELIMITER ;

    
 

 

