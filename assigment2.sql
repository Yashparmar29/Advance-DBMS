USE emp;
#create table student(id int(20),stud_name varchar(30),class varchar(30),address varchar(50));

/* 
code for insert ------
*/
DELIMITER //
create procedure stude(in sid int(20),in sname varchar(30),in sclass varchar(30),in saddress varchar(40))
begin
	insert into student(id,stud_name,class,address) values(sid,sname,sclass,saddress);
end //
DELIMITER ;
CALL stude(01,'yash parmar','mca E','surat');
select * from student;

/*
DELIMITER //
create procedure update_stud3(in sid int(20),in sname varchar(30),in sclass varchar(30),in saddress varchar(40))
begin
	update student 
    set 
    stud_name = sname,
    class = sclass,
    address = saddress
    WHERE
    id = sid;
end //
DELIMITER ;
CALL update_stud3(01,'bhavik parmar','mca D','surat');
*/