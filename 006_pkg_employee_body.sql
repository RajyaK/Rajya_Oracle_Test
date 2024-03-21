CREATE OR REPLACE PACKAGE BODY pkg_employee AS

--3.Create an appropriate executable database object to allow an Employee to be created.

PROCDURE sp_create_emp ( p_name      IN employees.employee_name%TYPE
                       , p_jobtitle  IN employees.job_title%TYPE
					   , p_managerid IN employees.manager_id%TYPE DEFAULT NULL
					   , p_hiredate  IN employees.date_hired%TYPE
					   , p_salary    IN employees.salary%TYPE
					   , p_deptid    IN employees.department_id%TYPE
					   ) 
IS
   is_valid BOOLEAN := TRUE;
BEGIN
   IF p_name IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('Employee name can not be null');
	  is_valid := FALSE;
   END IF;
   
   IF p_jobtitle IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('Employee job title can not be null');
	  is_valid := FALSE;
   END IF;
   
   IF p_hiredate IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('Employee hire date can not be null');
	  is_valid := FALSE;
   END IF;
   
   IF p_salary IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('Employee salary can not be null');
	  is_valid := FALSE;
   END IF;
   
   IF p_deptid IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('Employee department id can not be null');
	  is_valid := FALSE;
   END IF;
   
   IF is_valid THEN   
     INSERT INTO employees ( 
                         , employee_name
						 , job_title
						 , manager_id
						 , date_hired
						 , salary
						 , department_id
						 )
				VALUES   (
                         , p_name
                         , p_jobtitle
                         , p_managerid
                         , p_hiredate
                         , p_salary
                         , p_deptid
                         );	
     COMMIT;
   END IF;
	
EXCEPTION
    WHEN OTHERS THEN
	   ROLLBACK;
       DBMS_OUTPUT.PUT_LINE('ERROR ' ||SQLERRM);
END sp_create_emp;

/* 4.Create an appropriate executable database object to allow the Salary for an
     Employee to be increased or decreased by a percentage
*/

PROCEDURE sp_update_emp_salary(p_empid IN employees.employee_id%TYPE
                              ,p_percentage_change IN NUMBER
							  )
AS
  BEGIN
    UPDATE employees
       SET salary = salary + (salary * (p_percentage_change / 100))
     WHERE employee_id = p_empid;
  
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('ERROR ' ||SQLERRM);
  END sp_update_emp_salary;

/* 5. Create an appropriate executable database object to allow the transfer of an
      Employee to a different Department
*/
  
PROCEDURE sp_emp_transfer( p_empid     IN employees.employee_id%TYPE                    
                         , p_dept_name IN departments.department_name%TYPE
	                      )
AS

   v_departmentid  employees.department_id%TYPE;
   
BEGIN
    IF p_dept_name IS NOT NULL THEN
	   SELECT department_id
	     INTO v_departmentid
		 FROM departments
		WHERE department_name = p_dept_name;
    ELSE
       DBMS_OUTPUT.PUT_LINE('Please enter the valid department name');	
	END IF

    IF p_empid IS NOT NULL AND v_departmentid IS NOT NULL THEN
	
	    UPDATE employees
		   SET department_id = v_departmentid
		 WHERE employee_id = p_empid;
	    
		COMMIT;
		
		DBMS_OUTPUT.PUT_LINE('Employee successfully transferred to'|| p_dept_name || 'department');
		
	END IF;

EXCEPTION
    WHEN OTHERS THEN
	   ROLLBACK;
       DBMS_OUTPUT.PUT_LINE('ERROR ' ||SQLERRM);
END sp_emp_transfer;

/* 6. Create an appropriate executable database object to return the Salary for an
      Employee.
*/

FUNCTION fn_get_empsal (p_empid IN employees.employee_id%TYPE ) RETURN NUMBER
IS 
  v_salary employees.salary%TYPE
BEGIN
   
   SELECT Salary  
     INTO v_salary
	 FROM employees
	WHERE employee_id = p_empid;
	
RETURN v_salary
EXCEPTION
     WHEN no_data_found THEN
       RETURN NULL;
	 WHEN OTHERS THEN
	   DBMS_OUTPUT.PUT_LINE('ERROR ' ||SQLERRM);
END fn_get_empsal;

/* 7. Write a report to show all Employees for a Department */


PROCEDURE sp_report_emp_for_dept(p_deptid IN departments.department_id%TYPE) AS
  BEGIN
    -- Output the header
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE_ID,EMPLOYEE_NAME,JOB_TITLE');
  
    -- Cursor to select employee details
    FOR REC IN (SELECT employee_id, employee_name, job_title
                  FROM employees
                 WHERE department_id = p_deptid) LOOP
				 
      -- Output each row in CSV format
      DBMS_OUTPUT.PUT_LINE(REC.employee_id || ',' || REC.employee_name || ',' ||
                           REC.job_title);
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR ' ||SQLERRM);
  END sp_report_emp_for_dept;
  
/* 8. Write a report to show the total of Employee Salary for a Department */

PROCEDURE sp_report_total_empsal_for_dept(p_deptid IN departments.department_id%TYPE) AS
    v_total_salary NUMBER;
  BEGIN
    -- Output the header
    DBMS_OUTPUT.PUT_LINE('DEPARTMENT_ID,TOTAL_SALARY');
  
    -- Calculate the total salary for the department
    SELECT SUM(SALARY)
      INTO v_total_salary
      FROM employees
     WHERE department_id = p_deptid;
  
    -- Output the result in CSV format
    DBMS_OUTPUT.PUT_LINE(p_deptid || ',' || v_total_salary);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('DEPARTMENT_ID,TOTAL_SALARY');
      DBMS_OUTPUT.PUT_LINE(p_deptid || ',0');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('ERROR ' ||SQLERRM);
  END sp_report_total_empsal_for_dept;

END pkg_employee;
/