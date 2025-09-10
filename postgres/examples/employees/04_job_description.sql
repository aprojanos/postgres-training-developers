SET search_path = hr,finance,public;

ALTER TABLE jobs ADD description text;
CREATE INDEX idx_jobs_description ON jobs USING GIN (to_tsvector('english', description));

-- HR Manager
UPDATE jobs SET description = 'The HR Manager is responsible for overseeing all aspects of human resources practices and processes. This role involves managing recruitment, employee relations, performance management and training, and ensuring compliance with labor laws. The HR Manager will act as a strategic partner to senior management and provide guidance on HR-related issues.

Key Responsibilities:

Implement HR strategies and initiatives aligned with the overall business strategy.

Manage the recruitment and selection process, including job postings, interviews, and onboarding.

Oversee employee relations, including conflict resolution, disciplinary actions, and grievance handling.

Ensure compliance with labor regulations and update policies as needed.

Administer employee benefits programs and manage payroll processes.

Conduct performance evaluations and provide coaching to employees and managers.

Maintain HR records and prepare reports for senior management.

Qualifications:

Bachelor’s degree in Human Resources, Business Administration, or related field.

5+ years of experience in HR management.

Strong knowledge of labor laws and HR best practices.

Excellent communication, leadership, and interpersonal skills.

HR certification (e.g., SHRM-CP, PHR) is a plus.' WHERE job_id = 1;

-- HR Specialist
UPDATE jobs SET description = 'The HR Specialist supports the HR department in various functions, including recruitment, employee relations, benefits administration, and HR compliance. This role requires strong organizational skills and attention to detail to ensure smooth HR operations.

Key Responsibilities:

Assist in the recruitment process, including posting job ads, screening resumes, and scheduling interviews.

Maintain employee records and ensure data accuracy in HR systems.

Administer employee benefits programs and assist with enrollment.

Support the performance management process by tracking evaluations and providing documentation.

Handle employee inquiries regarding HR policies, benefits, and procedures.

Ensure compliance with labor laws and company policies.

Prepare HR reports and presentations as needed.

Qualifications:

Bachelor’s degree in Human Resources, Business Administration, or related field.

2+ years of experience in HR or a related role.

Knowledge of HR software and Microsoft Office Suite.

Strong organizational and communication skills.

Attention to detail and ability to maintain confidentiality.' WHERE job_id = 2;

-- Software Manager
UPDATE jobs SET description =  'The Software Manager oversees the development and delivery of software projects. This role involves managing a team of software engineers, coordinating with stakeholders, and ensuring projects are completed on time and within budget. The Software Manager will also contribute to strategic planning and process improvement.

Key Responsibilities:

Lead and manage a team of software engineers, providing guidance and mentorship.

Plan and execute software development projects, ensuring timely delivery.

Collaborate with product managers, designers, and other stakeholders to define project requirements.

Monitor project progress, identify risks, and implement mitigation strategies.

Ensure code quality through code reviews and adherence to best practices.

Manage resource allocation and budget for software projects.

Stay updated on industry trends and emerging technologies.

Foster a culture of innovation and continuous improvement within the team.

Qualifications:

Bachelor’s degree in Computer Science, Software Engineering, or related field.

5+ years of experience in software development, with 2+ years in a managerial role.

Strong technical skills in programming languages (e.g., Java, Python, C#).

Experience with Agile methodologies and project management tools.

Excellent leadership, communication, and problem-solving skills.' WHERE job_id = 3;

-- Software Engineer
UPDATE jobs SET description =  'The Software Engineer designs, develops, and maintains software applications. This role involves writing clean, efficient code, troubleshooting issues, and collaborating with cross-functional teams to deliver high-quality software solutions.

Key Responsibilities:

Develop and maintain software applications based on project requirements.

Write clean, efficient, and well-documented code.

Collaborate with product managers, designers, and other engineers to define and implement features.

Troubleshoot and debug software issues.

Participate in code reviews to ensure code quality and adherence to best practices.

Stay updated on emerging technologies and industry trends.

Contribute to the improvement of development processes and tools.

Qualifications:

Bachelor’s degree in Computer Science, Software Engineering, or related field.

2+ years of experience in software development.

Proficiency in programming languages (e.g., Java, Python, C#).

Experience 

Experience with version control systems (e.g., Git).

Strong problem-solving and analytical skills.

Knowledge of Agile methodologies is a plus.' WHERE job_id = 4;

-- Finance Manager
UPDATE jobs SET description =  'The Finance Manager oversees the financial operations of the organization, including budgeting, forecasting, financial reporting, and compliance. This role involves providing strategic financial guidance to senior management and ensuring the organization’s financial health.

Key Responsibilities:

Prepare and manage budgets, forecasts, and financial plans.

Monitor financial performance and provide analysis and reports to senior management.

Ensure compliance with financial regulations and accounting standards.

Oversee the preparation of financial statements and tax filings.

Manage cash flow and optimize working capital.

Lead and mentor the finance team.

Collaborate with other departments to support business objectives.

Identify opportunities for cost reduction and process improvement.

Qualifications:

Bachelor’s degree in Finance, Accounting, or related field.

5+ years of experience in finance or accounting, with 2+ years in a managerial role.

Strong knowledge of financial regulations and accounting principles.

Proficiency in financial software and Microsoft Excel.

Excellent analytical, communication, and leadership skills.

CPA or CMA certification is a plus.' WHERE job_id = 5;

-- Finance Analyst
UPDATE jobs SET description =  'The Finance Analyst supports the finance department by analyzing financial data, preparing reports, and assisting with budgeting and forecasting. This role requires strong analytical skills and attention to detail.

Key Responsibilities:

Analyze financial data and prepare reports for management.

Assist in the preparation of budgets, forecasts, and financial plans.

Monitor financial performance and identify trends and variances.

Support the month-end and year-end closing processes.

Conduct financial modeling and scenario analysis.

Assist with compliance and audit activities.

Collaborate with other departments to gather and analyze financial information.

Provide recommendations for cost reduction and process improvement.

Qualifications:

Bachelor’s degree in Finance, Accounting, or related field.

2+ years of experience in financial analysis or a related role.

Strong analytical and problem-solving skills.

Proficiency in financial software and Microsoft Excel.

Knowledge of financial regulations and accounting principles.

Attention to detail and ability to work under tight deadlines.' WHERE job_id = 6;

