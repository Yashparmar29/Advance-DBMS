DELIMITER //
CREATE PROCEDURE bonus()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_emp_id INT;
    DECLARE v_salary DECIMAL(10,2);

    DECLARE hr_cursor CURSOR FOR
        SELECT emp_id, salary
        FROM employees
        WHERE emp_dept = 'HR';


    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN hr_cursor;

    hr_loop: LOOP
        FETCH hr_cursor INTO v_emp_id, v_salary;
        IF done = 1 THEN
            LEAVE hr_loop;
        END IF;

        UPDATE employees
        SET salary = v_salary * 1.10
        WHERE emp_id = v_emp_id;
    END LOOP;

    CLOSE hr_cursor;
END //

DELIMITER ;
call bonus();