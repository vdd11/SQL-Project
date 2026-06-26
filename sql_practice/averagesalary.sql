SELECT 
   ROUND(AVG(salary_hour_avg), 2) AS average_hourly_salary,
   ROUND(AVG(salary_year_avg)) AS average_yearly_salary,
   job_schedule_type 
FROM job_postings_fact 
WHERE
    job_posted_date > '2023-06-01'
    AND (salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL)

GROUP BY
    job_schedule_type
ORDER BY
    average_hourly_salary DESC
    NULLS LAST
;
