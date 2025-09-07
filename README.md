# Introduction
📊 Dive into the data job market! Focusing on data engineer roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_job_hunting folder](/project_job_hunting/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

## Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis
Each query for this project aimed at investigating specific aspects of the data engineer job market. Here’s how I approached each question:

### 1. Top Paying Data Engineer Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Engineer' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

```
Here are the insights from the **salary\_year\_avg** column on top paying jobs:

* **Maximum salary:** \$325,000
* **Minimum salary:** \$242,000
* **Average salary (mean):** \$268,300
* **Median salary:** \$250,000
* **Standard deviation:** \~\$34,183 → salaries are relatively close, but the Engtal jobs at \$325k are clear outliers.

### Top 3 paying roles

1. **Data Engineer @ Engtal** – \$325,000 (appears twice)
2. **Data Engineer @ Durlston Partners** – \$300,000

### Salary distribution

* \$250,000 → 3 postings
* \$325,000 → 2 postings
* \$245,000 → 2 postings
* \$300,000 → 1 posting
* \$251,000 → 1 posting
* \$242,000 → 1 posting

### Key takeaways

* The **bulk of salaries** cluster between \$242k–\$251k (lower range) and \$245k–\$250k (mid range).
* **Engtal’s Data Engineer roles dominate the high end** at \$325k, significantly above the median.
* Senior or leadership titles (e.g., *Principal Data Engineer, Staff Data Engineer, Director, Manager*) mostly fall between \$242k–\$251k, meaning **individual contributor roles (like Data Engineer at Engtal)** can sometimes pay more than leadership positions.
![Top paying roles](assets\Figure_4.png)
*Bar graph visualizing the salary for the top 10 salaries for data engineer; ChatGPT generated this graph from my SQL query results*

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Engineer' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;  
  ```
Here's a concise insight based on the **skills used in top-paying data engineering roles (LinkedIn 2023)**:

1. **Python** is the most frequently listed skill across top-paying roles, confirming its dominance in data engineering for scripting, data manipulation, and pipelines.
2. **Spark**, **Kafka**, **Pyspark**, and **Hadoop** appear regularly, emphasizing the high value of **big data and distributed processing frameworks** in top-tier roles.
3. **Cloud skills** like **AWS**, **Azure**, **GCP**, and tools like **Kubernetes** and **Databricks** are present, signaling a strong demand for **cloud-native data engineering**.
4. The presence of **SQL**, **Scala**, and **Java** highlights that **traditional database querying** and **strong typed programming** remain important for scalable system design.
5. Less common but high-paying roles also list skills like **Go**, **Perl**, and **ML-related tools** (e.g., TensorFlow, PyTorch), suggesting a premium for engineers with **niche or cross-disciplinary expertise**.


![bar chart showing skills for top paying jobs](assets\Figure_5.png)
*Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results*


### 3. In-Demand Skills for Data Engineer

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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

```
Here's the breakdown of top paying job skills :

1. **SQL** tops the list with over **14,000 job postings**, reaffirming its role as a foundational skill for data engineers.
2. **Python** follows closely behind, highlighting its widespread use in data pipelines, ETL processes, and analytics.
3. **AWS** and **Azure** show that **cloud proficiency is essential**, with over **15,000 combined mentions**, reflecting the industry's shift to cloud-native data infrastructure.
4. **Apache Spark** appears prominently, emphasizing the demand for skills in **distributed data processing** and big data tools.
5. Overall, the most in-demand skills combine **data querying, programming, cloud platforms, and scalable processing**, forming the modern data engineering stack.


*Bar Chart showing top paying job skills, this chart was generated by ChatGPT*

| Skill      | Demand Count |
| ---------- | ------------ |
| **SQL**    | 14,213       |
| **Python** | 13,893       |
| **AWS**    | 8,570        |
| **Azure**  | 6,997        |
| **Spark**  | 6,612        |
*The Table showing the most top paying job-skills for Data Engineer*

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
![Bar chart showing top paying skills](assets\Figure_1.png)

*Bar Chart showing top paying job skills, this chart was generated by ChatGPT*

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.
```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
**Here's the breakdown of optimal skills data**

📊 Optimal Data Engineering Skills (LinkedIn 2023)
The most optimal skills for data engineers strike a balance between high salary and strong demand. Tools like Spark, Kafka, Airflow, Scala, and Kubernetes consistently offer high compensation ($138K–$158K) while appearing frequently in job listings. These technologies represent the sweet spot for engineers aiming to maximize both marketability and earning potential.

![bar chart showing optimal skill](assets\Figure_6.png)

*Bar chart showing optimal skills for Data Engineer jobs, this chart was created by ChatGPT*

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Engineer Jobs**: The highest-paying jobs for data engineer that allow remote work offer a wide range of salaries, the highest at $650,000!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.


