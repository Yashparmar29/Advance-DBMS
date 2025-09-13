use emp;

#create table employee(emp_id int(10)primary key,emp_name varchar(30),dept varchar(30),salary int(20));
delimiter //
create procedure add_update2(in inup varchar(20))
begin
	if inup = 'insert' then
		insert into employee values(01,'yash parmar','web development',70000);
	else
		update employee set emp_name = 'bhavik parmar',dept = 'web development',salary = 70000 where emp_id = 01;
	end if;
    select * from employee;
end //
delimiter ;
#call add_update1('insert');
call add_update2('update');
