delimiter $$
create definer=`root`@`localhost` procedure insert_employee ( in EmpID bigint(11), in Name varchar(30), in Surname varchar(40), in Address varchar(45), in Birth_date date,
																		in Birth_place varchar(30), in Email varchar(32), in Tel varchar(30), in Duty tinyint(1),
																		in Bank_account_number varchar(20), in Salary decimal(10,3), in BranchID int(11))

begin
insert into employee values (EmpID,Name,Surname,Address,Birth_date,Birth_place,Email,Tel,Duty,Bank_account_number,Salary,BranchID);

end $$
delimiter ;