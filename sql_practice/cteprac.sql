WITH company_job_count AS (
    SELECT
        company_id,
    COUNT(*) AS total_jobs
    FROM 
    job_postings_fact
    GROUP BY  
        company_id
    ORDER BY
        total_jobs DESC
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs,
    CASE
        WHEN total_jobs > 50 THEN 'Large'
        WHEN total_jobs >= 10 THEN 'Medium'
        WHEN total_jobs > 0 THEN 'Small'
        ELSE 'No Job postings'
    END AS company_size
FROM company_dim
LEFT JOIN company_job_count
    ON company_dim.company_id = company_job_count.company_id
ORDER BY
    total_jobs DESC NULLS LAST