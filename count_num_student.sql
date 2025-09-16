delimiter //
create procedure num_student1(in dep varchar(39))
begin
	declare scount int default 0;
    declare sdept varchar(30);
    select sdept into dept from student;
    
    if sdept = dept then
		set scount = scount + 1;
	end if;
	select count as status;
end //
delimiter ;
call num_student1('BCA');