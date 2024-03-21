
INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90001,'John Smith','CEO',NULL,TO_DATE('01/01/1995','DD/MM/YYYY'),100000,1);
			
INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90002,'Jimmy Willis','Manager',90001,TO_DATE('23/09/2003','DD/MM/YYYY'),52500,4);
			
INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90003,'Roxy Jones','Salesperson',90002,TO_DATE('11/02/2017','DD/MM/YYYY'),35000,4);

INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90004,'Selwyn Field','Salesperson',90003,TO_DATE('20/05/2015','DD/MM/YYYY'),32000,4);

INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90005,'David Hallett','Engineer',90006,TO_DATE('17/04/2018','DD/MM/YYYY'),40000,2);

INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90006,'Sarah Phelps','Manager',90001,TO_DATE('21/03/2015','DD/MM/YYYY'),45000,2);
			
INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90007,'Louise Harper','Engineer',90006,TO_DATE('01/01/2013','DD/MM/YYYY'),47000,2);
			
INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90008,'Tina Hart','Engineer',90009,TO_DATE('28/07/2014','DD/MM/YYYY'),45000,3);
			
INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90009,'Gus Jones','Manager',90001,TO_DATE('15/05/2018','DD/MM/YYYY'),50000,3);
			
INSERT INTO employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id) 
            VALUES (90010,'Mildred Hall','Secretary',90001,TO_DATE('12/10/1996','DD/MM/YYYY'),35000,1);
			
COMMIT;
/