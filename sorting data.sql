#Parameterized Select
#Write a procedure that takes a department name as input and lists all employees from that department

delimiter //
create procedure all_student(in dep varchar(30))
begin
	select * from student where dept = dep; 
end //
delimiter ;
call all_student('BCA');