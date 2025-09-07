/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

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


/* Here's a **short analysis of the "skills" column** from your top-paying data-related job roles in 2023:

---

### 🔥 **Most In-Demand Skills**

* **Python**: Dominates across almost all roles – a *must-have* for high-paying data roles.
* **Spark**: Key for big data processing; common in top roles.
* **Pandas, NumPy, PySpark, Hadoop, Kafka**: Frequently appear together; typical of modern data engineering stacks.
* **SQL**: Still highly relevant, especially in managerial roles.

---

### 🧠 **Advanced/Bonus Skills**

* **TensorFlow, Keras, PyTorch**: Indicate crossover with ML/AI – valued in Director-level positions (e.g., Twitch).
* **Scala & Databricks**: Valued in roles involving large-scale data platforms (e.g., Signify Tech).
* **Cloud**: GCP, AWS, Azure show up in a few roles, but **less frequent** than expected – possibly integrated into other listed tools/platforms.

---

### 🏢 **Company-Specific Patterns**

* **Engtal**: Lists full modern data engineering stack – Spark, Hadoop, Kubernetes, Kafka, Python, etc.
* **Signify Technology**: Emphasizes **Scala + Databricks**, signaling strong preferences.
* **Meta**: Unique for listing **Perl** and **Java** – possible legacy system support.

---

### 🧩 **Less Common but Notable**

* **Go**, **R**, **NoSQL**, **Perl**: Appear in niche or specialized roles – not must-haves, but can differentiate.

---

### 💰 **Insight Summary**

* For **\$250K+ jobs**, the core stack is:
  `Python + Spark + Hadoop + Kafka (+ Cloud or ML frameworks optional)`
* Mastering **Python, Spark, and Cloud/Big Data tools** is key for breaking into top salary tiers.
* **Soft clustering** of skills:

  * *Big Data Stack*: Spark, Hadoop, Kafka, PySpark
  * *ML/AI*: TensorFlow, PyTorch, Keras
  * *Cloud & Platform*: Databricks, AWS, GCP, Azure
  * *Programming Languages*: Python, Scala, Java

Result

=====
[
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "Durlston Partners",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "Durlston Partners",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "pytorch"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "azure"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "245000.0",
    "company_name": "Handshake",
    "skills": "go"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "gcp"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "perl"
  }
]
 */
