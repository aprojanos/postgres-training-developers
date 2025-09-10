SET search_path = hr,finance,public;

INSERT INTO departments (name, location) VALUES
('HR', 'Budapest'),
('IT', 'Szeged'),
('Finance', 'Berlin');

INSERT INTO jobs (title, min_salary, max_salary) VALUES
('HR Manager', 80000, 120000),
('HR Specialist', 60000, 100000),
('Software Application Manager', 100000, 150000),
('Software Engineer', 70000, 120000),
('Finance Manager', 120000, 160000),
('Finance Analyst', 55000, 110000);

INSERT INTO employees (first_name, last_name, email, hire_date, department_id, job_id, manager_id) VALUES
('Laura', 'Tóth', 'laura@example.com', '2023-01-10', 1, 1, NULL),
('Tibor', 'Török', 'tibor@example.com', '2022-03-15', 1, 2, 1),
('István', 'Juhász', 'istvan@example.com', '2021-07-20', 2, 3, NULL),
('György', 'Farkas', 'gyuri@example.com', '2020-11-20', 2, 4, 3),
('Ilona', 'Papp', 'ilona@example.com', '2019-08-15', 3, 5, NULL),
('Bianka', 'Balogh', 'bianka@example.com', '2008-01-07', 3, 6, 5),
('Renáta', 'Szabó', 'renata@example.com', '2024-12-01', 2, 6, 4);

UPDATE employees SET address = 'Szenthídháza, Bakonymelléki utca 92.' 
	WHERE employee_id = 1;
UPDATE employees SET address = 'Hetvenbánya, Alsógyörgyi utca 13.' 
	WHERE employee_id = 2;

INSERT INTO salaries (employee_id, salary, change_date) VALUES
(1, 85000, '2025-01-15'),
(2, 70000, '2024-01-15'),
(3, 110000, '2025-01-15'),
(4, 120000, '2024-01-15'),
(5, 130000, '2025-01-15'),
(6, 70000, '2024-01-15'),
(7, 50000, '2024-12-01');


INSERT INTO budgets (department_id, year, total_budget) 
VALUES (1, 2025, 1000000), (2, 2025, 1500000), (3, 2025, 2000000);

INSERT INTO expenses (department_id, amount, expense_date, description) 
VALUES (1, 50000, '2025-02-15', 'Customer Acquisition'),
       (2, 100000, '2025-02-01', 'Software licenses'),
       (3, 150000, '2025-01-20', 'Office Equipment');
       

INSERT INTO projects (name) VALUES 
	('PandaPulse'),
	('BananaByte'),
	('JellyForge'),
	('CodeKitten')
;

INSERT INTO employee_projects (employee_id, project_id) VALUES
(1, 1), (1, 3), -- Laura
(2, 1), (2, 2), -- Tibor
(3, 2), (3, 3), -- Istvan
(4, 3), -- Gyuri
(5, 4), (5, 3), -- Ilona
(6, 4); -- Bianka
