WITH q1_postings AS (
    SELECT job_id, company_id, job_title_short, job_location, job_via, job_posted_date, salary_year_avg
    FROM jan_2023
    
    UNION ALL
    
    SELECT job_id, company_id, job_title_short, job_location, job_via, job_posted_date, salary_year_avg
    FROM feb_2023
    
    UNION ALL
    
    SELECT job_id, company_id, job_title_short, job_location, job_via, job_posted_date, salary_year_avg
    FROM mar_2023
)

SELECT 
    company_dim.name AS company_name,
    q1_postings.job_title_short,
    q1_postings.job_location,
    q1_postings.job_via,
    q1_postings.job_posted_date::DATE,
    q1_postings.salary_year_avg
FROM q1_postings
INNER JOIN company_dim
    ON q1_postings.company_id = company_dim.company_id
WHERE 
    q1_postings.salary_year_avg > 70000 AND
    q1_postings.job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;