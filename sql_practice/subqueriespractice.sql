WITH skills_counted AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count 
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY 
        skill_count DESC
    LIMIT 5
)
SELECT 
    skills_dim.skills AS skill_name,
    skills_counted.skill_count
FROM 
    skills_counted
LEFT JOIN skills_dim
    ON skills_dim.skill_id = skills_counted.skill_id
ORDER BY
    skill_count DESC
