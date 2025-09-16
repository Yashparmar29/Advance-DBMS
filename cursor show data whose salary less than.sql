#create table employee(id int(30)primary key,name varchar(30),dept varchar(20),salary int);
/*insert into employee values(01,'yash parmar','HR',90000);
insert into employee values(02,'bhavik parmar','FINANCE',85000);
insert into employee values(03,'yugant patel','DEVELOPMENT',76000);
insert into employee values(04,'neel bhavnagari','HR',94000);
insert into employee values(05,'yash kachhadiya','FINANCE',80200);*/

delimiter //
create procedure show_emp1()
begin
	declare v_name varchar(30);
    declare v_dept varchar(20);
    declare done int default false;
    
	declare emp_data cursor for
		select name,dept from employee where salary <= 81000;
        declare continue handler for not found set done = true;
	open emp_data;
    read_loop : loop
		fetch emp_data into v_name,v_dept;
        if done then
			leave read_loop;
		end if;
        select v_name as name,v_dept as dept;
	end loop;
    close emp_data;
end //
delimiter ;
call show_emp1();
