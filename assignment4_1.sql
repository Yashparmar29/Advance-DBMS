use employee;
create table employees(emp_id int(20)primary key,emp_name varchar(40),emp_dept varchar(40),salary decimal(10,2));
DELIMITER //

CREATE PROCEDURE all_employees414()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_emp_id INT;
    DECLARE v_emp_name VARCHAR(100);
    DECLARE v_emp_dept VARCHAR(100);
    declare v_salary decimal(10,2);

    DECLARE emp_cursor CURSOR FOR 
        SELECT emp_id, emp_name, emp_dept,salary FROM employees;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO v_emp_id, v_emp_name, v_emp_dept,v_salary;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO employees (emp_id, emp_name, emp_dept, salary)
        VALUES (v_emp_id, v_emp_name, v_emp_dept, v_salary);
    END LOOP;

    -- Close cursor
    CLOSE emp_cursor;
END //

DELIMITER ;
call all_employees414();
select * from employees;
