/*
use emp;

insert into employee values(02,'yash parmar','HR',80000);
insert into employee values(03,'darshan kachhadiya','finance',87000);
insert into employee values(04,'neel bhavnagari','human resource',70000);
insert into employee values(05,'yash kachhadiya','HR',40000);
select * from employee;
*/

delimiter //
create procedure high_sal6(in id int,in e_name varchar(30))
begin
	DECLARE v_target_salary INT;
	SELECT salary INTO v_target_salary
    FROM employee
    WHERE emp_id = id AND emp_name = e_name;
    IF v_target_salary IS NOT NULL THEN
        SELECT
            emp_id,
            emp_name,
            dept,
            salary
        FROM
            employee
        WHERE
            salary >= v_target_salary;
    END IF;
end //
delimiter ;
call high_sal6(03,'darshan kachhadiya');