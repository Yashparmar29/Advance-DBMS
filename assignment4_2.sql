DELIMITER //

CREATE PROCEDURE calc_total1()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_dept VARCHAR(100);
    DECLARE v_total_salary DECIMAL(15,2);

    DECLARE dept_cursor CURSOR FOR 
        SELECT DISTINCT emp_dept FROM employees;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN dept_cursor;

    read_loop: LOOP
        FETCH dept_cursor INTO v_dept;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT SUM(salary) 
        INTO v_total_salary
        FROM employees
        WHERE emp_dept = v_dept;

        INSERT INTO dept_salary_summary (dept_name, total_salary, calc_time)
        VALUES (v_dept, v_total_salary, NOW());
    END LOOP;

    CLOSE dept_cursor;
END //

DELIMITER ;

call calc_total1();
select * from employees;