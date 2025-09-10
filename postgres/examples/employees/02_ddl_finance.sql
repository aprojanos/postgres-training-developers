CREATE SCHEMA finance;

CREATE TABLE finance.budgets (
    budget_id SERIAL PRIMARY KEY,
    department_id INT REFERENCES hr.departments(department_id),
    year INT NOT NULL,
    total_budget NUMERIC(12,2) NOT NULL
);

CREATE TABLE finance.expenses (
    expense_id SERIAL PRIMARY KEY,
    department_id INT REFERENCES hr.departments(department_id),
    amount NUMERIC(12,2) NOT NULL,
    expense_date DATE NOT NULL,
    description TEXT
);


-- grant access
CREATE USER finance_user WITH PASSWORD 'finance';
GRANT USAGE ON SCHEMA finance TO finance_user;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA finance TO finance_user;