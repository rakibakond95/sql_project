/*
Question: What are the most in-demand skills for data engineer?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


/* 
🔍 Insights
1. SQL is still king 👑

Despite all the modern tools, SQL remains the most in-demand skill, reinforcing its foundational role in data engineering and analytics.

2. Python is nearly as critical 🐍

Widely used for data pipelines, automation, ETL, and integration with frameworks (e.g., Spark, Pandas).

3. Cloud skills are essential ☁️

AWS and Azure together account for 15,567 job mentions, showing that cloud-native data pipelines are now standard.

4. Spark holds strong as the big data engine ⚡

Still a core technology for handling distributed data processing, especially in cloud or big data environments.

✅ Summary

To stay competitive in data engineering:

Learn SQL + Python as your foundation, and master a cloud platform (AWS/Azure) + Spark for handling large-scale data systems.
Result 
===
[
  {
    "skills": "sql",
    "demand_count": "14213"
  },
  {
    "skills": "python",
    "demand_count": "13893"
  },
  {
    "skills": "aws",
    "demand_count": "8570"
  },
  {
    "skills": "azure",
    "demand_count": "6997"
  },
  {
    "skills": "spark",
    "demand_count": "6612"
  }
]
 */
