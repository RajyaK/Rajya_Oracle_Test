CREATE OR REPLACE PACKAGE pkg_employee AS

  -- Procedure to create a new employee
  PROCEDURE sp_create_emp ( p_name      IN employees.employee_name%TYPE
                       , p_jobtitle  IN employees.job_title%TYPE
					   , p_managerid IN employees.manager_id%TYPE DEFAULT NULL
					   , p_hiredate  IN employees.date_hired%TYPE
					   , p_salary    IN employees.salary%TYPE
					   , p_deptid    IN employees.department_id%TYPE
					   );
					   
  -- Procedure to update an employee's salary by a percentage					   
  PROCEDURE sp_update_emp_salary(p_empid IN employees.employee_id%TYPE
                                ,p_percentage_change IN NUMBER
							    );
   	
  -- Procedure to transfer an employee to a different department	
  PROCEDURE sp_emp_transfer( p_empid     IN employees.employee_id%TYPE                    
                           , p_dept_name IN departments.department_name%TYPE
	                       );
						   
  -- Function to get an employee's salary						   
  FUNCTION fn_get_empsal (p_empid IN employees.employee_id%TYPE ) RETURN NUMBER;
  
  
  -- Procedure to report all employees for a given department
  PROCEDURE sp_report_emp_for_dept(p_deptid IN departments.department_id%TYPE);
  
  -- Procedure to report the total of employee salaries for a given department
  PROCEDURE sp_report_total_empsal_for_dept(p_deptid IN departments.department_id%TYPE);
  
END pkg_employee;
/