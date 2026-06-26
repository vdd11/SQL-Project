WITH q1_jobs AS (
    SELECT 
        job_id,
        job_title_short,
        salary_year_avg
    FROM jan_2023
    WHERE
        salary_year_avg > 70000
    
    UNION ALL
    SELECT 
        job_id,
        job_title_short,
        salary_year_avg
    FROM feb_2023
    WHERE
        salary_year_avg > 70000
    
    UNION ALL
    SELECT 
        job_id,
        job_title_short,
        salary_year_avg
    FROM mar_2023
    WHERE
        salary_year_avg > 70000
)
SELECT 
    
    q1_jobs.job_title_short,
    q1_jobs.salary_year_avg,
    skills_dim.skills,
    skills_dim.type
FROM q1_jobs
LEFT JOIN skills_job_dim
    ON q1_jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id