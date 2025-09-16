#create database yash;
#use yash;
#create table product(prod_id int(10),prod_name varchar(20),qty int(15));
#insert into product values(01,'computer',500);
#insert into product values(02,'iron',200);
#insert into product values(03,'machine',350);
#insert into product values(04,'laptop',650);
#insert into product values(05,'router',500);

#select * from product;

/*delimiter //
create procedure higher_prod(in prod_id int(10))
begin
	select * from product where qty > 50;
end //

delimiter ;
call higher_prod(1);*/

/*delimiter //
create procedure display1_prod(in id int(15))
begin
	declare field varchar(20);
    select prod_name into field  from product where prod_id=id;
    if field = 'computer' then
		select 'IT' as status;
	elseif field = 'iron' then
		select 'MECH' as status;
	else
		select 'NO-CATEGORY' as status;
	end if;
end //

delimiter ;
call display1_prod(2);*/

delimiter //
create procedure stock1_prod(in id int(10))
begin
	declare available_stock int(20);
    select qty into available_stock  from product where prod_id=id;
    if available_stock < 300 then
		select 'low stock' as status;
	elseif available_stock < 500 && available_stock > 300 then
		select 'average stock' as status;
	else
		select 'higher stock' as status;
	end if;
end //

delimiter ;
call stock1_prod(1);


