delimiter //
create procedure show_student2()
begin
	declare v_id int; 
	declare v_name varchar(30);
    declare v_class varchar(30);
    declare done int default false;
    
    declare stud cursor for 
    select id,stud_name,class from student where stud_name like 'b%';
    declare continue handler for not found set done = true;

    open stud;
    
    read_loop : loop
	
	fetch stud into v_id,v_name,v_class;
        if done then
			leave read_loop;
		end if;
        select v_id as id,v_name as stud_name,v_class as class;
    end loop;
    close stud;
end //
delimiter ;
call show_student2();