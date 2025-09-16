use employee;
DELIMITER //
create procedure pattern1(in num int)
begin
	declare counter int default 1;
	loop_label : loop
    select counter as status;
    if counter <= num then
    leave loop_label;
    end if;
    end loop loop_label;
end //
delimiter ;
call pattern1(10);