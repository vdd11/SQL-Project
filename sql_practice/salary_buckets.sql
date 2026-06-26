SELECT
    name AS company_name,
    job_location AS location,
    ROUND(salary_hour_avg,2) AS salary_hour_avg,
    ROUND(salary_year_avg) AS salary_year_avg,
    CASE
        WHEN salary_hour_avg >= 50 OR salary_year_avg >= 100000 THEN 'High Salary'
        WHEN salary_hour_avg >= 25 OR salary_year_avg >= 50000 THEN 'Standard Salary'
        WHEN salary_hour_avg < 25 OR salary_year_avg < 50000 THEN 'Low Salary'
        ELSE 'Salary Not Reported'
    END AS salary_range
FROM company_dim
INNER JOIN job_postings_fact
    ON company_dim.company_id = job_postings_fact.company_id
WHERE 
    job_title_short = 'Data Analyst'
ORDER BY 
    CASE 
        WHEN salary_hour_avg >= 50 OR salary_year_avg >= 100000 THEN 1
        WHEN salary_hour_avg >= 25 OR salary_year_avg >= 50000 THEN 2
        WHEN salary_hour_avg < 25 OR salary_year_avg < 50000 THEN 3
        ELSE 4
    END ASC,
    salary_year_avg DESC NULLS LAST,
    salary_hour_avg DESC NULLS LAST;