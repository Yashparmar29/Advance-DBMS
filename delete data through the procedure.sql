#show databases;
#use yash;
#show tables;
delimiter //
create procedure delete_data(in id int)
begin
	delete from student where sid = id;
end //
delimiter ;
call delete_data(5);
select * from student;