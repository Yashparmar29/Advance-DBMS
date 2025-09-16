delimiter //
create procedure show1()
begin
	declare v_name varchar(30);
    declare v_salary int(20);
    declare done int default false;
    
	declare emp_data cursor for
		select name,salary from employee where dept = 'FINANCE';
        declare continue handler for not found set done = true;
	open emp_data;
    read_loop : loop
		fetch emp_data into v_name,v_salary;
        if done then
			leave read_loop;
		end if;
        select v_name as name,v_salary as salary;
	end loop;
    close emp_data;
end //
delimiter ;
call show1();
