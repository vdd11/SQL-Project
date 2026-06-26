SELECT 
    name AS company_name,
    job_title_short AS job_title,
    job_location AS location,
    job_via,
    job_health_insurance,
    ROUND(salary_hour_avg, 2) AS salary_hour_average


FROM company_dim
INNER JOIN job_postings_fact
    ON company_dim.company_id = job_postings_fact.company_id 
WHERE 
    job_health_insurance = TRUE AND
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023 AND
    EXTRACT(QUARTER FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2
ORDER BY
    salary_hour_avg DESC
    NULLS LAST
    
;