use yash;
DELIMITER //
CREATE procedure even1(in n int)
begin
	declare no int default 0;
    while n <= no do
		if(no%2) = 0 then
			select no as status;
		end if;
    end while;
end //
DELIMITER ;
CALL even1(8);