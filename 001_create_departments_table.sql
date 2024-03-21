-- DDL for DEPARTMENT Table
CREATE TABLE departments (department_id    NUMBER(5)    NOT NULL
                         ,department_name  VARCHAR2(50) NOT NULL  
                         ,location         VARCHAR2(50) NOT NULL 
			 );
						 
ALTER TABLE departments ADD COMMENT ON TABLE departments IS 'This table holds the department data';
ALTER TABLE departments ADD COMMENT ON COLUMN departments.department_id IS 'The unique identifier for the deparment';
ALTER TABLE departments ADD COMMENT ON COLUMN department.department_name IS 'The name of the department';
ALTER TABLE departments ADD COMMENT ON COLUMN departments.location IS 'The physical location of the department';

ALTER TABLE departments 
ADD CONSTRAINT departments_pk PRIMARY KEY (department_id);
/