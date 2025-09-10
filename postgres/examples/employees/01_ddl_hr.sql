CREATE SCHEMA hr;

CREATE TABLE hr.departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE hr.jobs (
    job_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    min_salary NUMERIC(10, 2) CHECK (min_salary > 0),
    max_salary NUMERIC(10, 2) CHECK (max_salary > min_salary)
);

CREATE TABLE hr.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(100),
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE,
    department_id INT REFERENCES hr.departments(department_id) ON DELETE SET NULL,
    job_id INT REFERENCES hr.jobs(job_id) ON DELETE SET NULL,
    manager_id INT REFERENCES hr.employees(employee_id) -- self referencing for hierarchy
);

-- Track Salary Changes
CREATE TABLE hr.salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES hr.employees(employee_id) ON DELETE CASCADE,
    salary NUMERIC(10,2) CHECK (salary > 0),
    change_date TIMESTAMP DEFAULT now()
);

CREATE TABLE hr.projects (
    project_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE hr.employee_projects (
    employee_id INT REFERENCES hr.employees(employee_id),
    project_id INT REFERENCES hr.projects(project_id),
    PRIMARY KEY (employee_id, project_id)
);

CREATE TABLE hr.salary_audit (
    audit_id SERIAL PRIMARY KEY,
    employee_id INT,
    old_salary NUMERIC,
    new_salary NUMERIC,
    change_date TIMESTAMP DEFAULT now()
);
CREATE VIEW vw_salaries
AS
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.name AS department,
    s.salary 
FROM hr.departments d
JOIN hr.employees e ON d.department_id = e.department_id
JOIN hr.salaries s ON e.employee_id = s.employee_id;
