CREATE DATABASE hr_db;

USE hr_db;

DESCRIBE hr_data;

SELECT * FROM hr_data;

-- Total Employees
SELECT count(*) AS Total_Employee
FROM hr_data;

-- Total Attrition Count
SELECT count(*) AS Total_Attrition
FROM hr_data
WHERE attrition = 'Yes';
-- select count(*) as total_attrition
-- from hr_data
-- where attrition_encoded = 1;

-- Attrition Rate
SELECT SUM(attrition_encoded) * 100 / COUNT(*) AS AttritionRate
FROM hr_data;

-- Average Age
SELECT AVG(age) AS avg_age
FROM hr_data;

-- Average Monthly Income
SELECT AVG(monthlyincome) AS avg_monthly_income
FROM hr_data;
-- We can also do like this
SELECT SUM(monthlyincome) / COUNT(*) AS avg_income
FROM hr_data;

-- Attrition Analysis by department
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(Attrition_encoded) AS attrition_count,
    SUM(Attrition_encoded) * 100 / COUNT(*) AS attrition_rate
FROM hr_data
GROUP BY department
ORDER BY attrition_rate DESC;

-- Attrition by Job Role
SELECT 
    jobrole,
    COUNT(*) AS total_employees,
    SUM(attrition_encoded) AS attrition_count,
    SUM(attrition_encoded) * 100 / COUNT(*) AS attrition_rate
FROM hr_data
GROUP BY jobrole
ORDER BY attrition_rate DESC;

-- Attrition by Gender
SELECT 
    gender,
    COUNT(*) AS total_employees,
    SUM(attrition_encoded) AS attrition_count,
    SUM(attrition_encoded) * 100.0 / COUNT(*) AS attrition_rate
FROM hr_data
GROUP BY gender;


-- Attrition Analysis by Age Group
SELECT 
	age_group,
	COUNT(*) AS total_employees,
    SUM(attrition_encoded) AS attrition_count,
    SUM(attrition_encoded) * 100 / COUNT(*) AS attrition_rate
FROM hr_data
GROUP BY age_group
ORDER BY attrition_rate DESC;


-- Attrition vs Monthly Income
SELECT attrition_encoded, AVG(monthlyincome) AS avg_salary
FROM hr_data
GROUP BY attrition_encoded;


-- Creating Salary Group
SELECT 
	CASE
		WHEN monthlyincome < 3000 THEN 'Low'
        WHEN monthlyincome BETWEEN 3000 AND 7000 THEN 'Medium'
        ELSE 'High'
	END AS salary_group,
	COUNT(*) AS TotalEmployee,
    SUM(attrition_encoded), 
    SUM(attrition_encoded) * 100 / COUNT(*) AS attrition_rate
FROM hr_data
GROUP BY salary_group
ORDER BY attrition_rate DESC;


-- Overtime Analysis
SELECT 
	overtime, COUNT(*) AS TotalEmployee,
	SUM(attrition_encoded) AS attrition_count,
    SUM(attrition_encoded) * 100 / COUNT(*) AS attrition_rate
    FROM hr_data
    GROUP BY overtime
    ORDER BY attrition_rate DESC;

-- Job Satisfaction Analysis
SELECT 
	jobsatisfaction, COUNT(*) AS TotalEmployee,
	SUM(attrition_encoded) AS attrition_count,
    SUM(attrition_encoded) * 100 / COUNT(*) AS attrition_rate
    FROM hr_data
GROUP BY jobsatisfaction
ORDER BY attrition_rate DESC;
    
-- Work Life Balance Analysis
SELECT 
	worklifebalance, COUNT(*) AS TotalEmployees,
	SUM(attrition_encoded) AS attrition_count,
    SUM(attrition_encoded) * 100 / COUNT(*) AS attrition_rate
    FROM hr_data
GROUP BY worklifebalance
ORDER BY attrition_rate DESC;

-- Years At Company Analysis
SELECT 
	yearsatcompany, COUNT(*) AS TotalEmployee,
	SUM(attrition_encoded) AS attrition_count,
    SUM(attrition_encoded) * 100 / COUNT(*) AS attrition_rate
    FROM hr_data
GROUP BY yearsatcompany
ORDER BY attrition_rate DESC;


    
    




