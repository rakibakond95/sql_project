/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Engineer roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Engineer' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Engineer'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True 
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

-- rewriting this same query more concisely
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
/*  
⚙️ Most Optimal Skills for Data Engineers (LinkedIn 2023)

These skills represent the best balance between demand and salary, making them highly strategic to learn for aspiring and current data engineers.

🔍 Key Insights
1. High Demand + High Pay = Must-Have Skills

Spark (Demand: 237 | Salary: $139K)

Kafka (134 | $150K)

Airflow (151 | $138K)

Java (139 | $138K)

Hadoop (98 | $137K)

🔑 These are core technologies in modern data pipelines. They're not only in high demand but also command strong salaries.

2. Emerging & Scalable Infrastructure Skills

Kubernetes (56 | $158K)

Terraform (44 | $146K)

Pyspark (64 | $139K)

🔧 These skills are critical in cloud-native and orchestration-heavy environments, ideal for building robust and scalable systems.

3. Database & Querying Technologies

Cassandra (19 | $151K)

DynamoDB (27 | $138K)

MongoDB (32 | $138K)

NoSQL (93 | $136K)

🧠 Indicates a shift from traditional RDBMS to distributed and NoSQL systems, especially in data-heavy companies.

4. Programming & Scripting

Scala (113 | $141K)

Golang (11 | $147K)

Shell (34 | $135K)

TypeScript (19 | $137K)

🛠️ Knowledge of system-level or performance-focused languages gives an edge in backend or low-latency data work.

5. Data Science & ML Tools

NumPy (14 | $157K)

Pandas (38 | $144K)

PyTorch (11 | $142K)

🎯 Helpful for hybrid roles where data engineering meets ML ops or model training pipelines.



🧩 These skills offer the best trade-off between market demand and high compensation in 2023.
If you're building a roadmap, prioritize:

Big Data & Stream Processing: Spark, Kafka, Airflow

Cloud & Infra: Kubernetes, Terraform

Modern Databases: MongoDB, Cassandra, DynamoDB

Languages: Scala, Java, Shell, Python libraries


Result

===
[
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "56",
    "avg_salary": "158190"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "14",
    "avg_salary": "157592"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "19",
    "avg_salary": "151282"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "134",
    "avg_salary": "150549"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demand_count": "11",
    "avg_salary": "147818"
  },
  {
    "skill_id": 212,
    "skills": "terraform",
    "demand_count": "44",
    "avg_salary": "146057"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "38",
    "avg_salary": "144656"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "demand_count": "21",
    "avg_salary": "144102"
  },
  {
    "skill_id": 144,
    "skills": "ruby",
    "demand_count": "14",
    "avg_salary": "144000"
  },
  {
    "skill_id": 30,
    "skills": "ruby",
    "demand_count": "14",
    "avg_salary": "144000"
  },
  {
    "skill_id": 83,
    "skills": "aurora",
    "demand_count": "14",
    "avg_salary": "142887"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "11",
    "avg_salary": "142254"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "113",
    "avg_salary": "141777"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "237",
    "avg_salary": "139838"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "64",
    "avg_salary": "139428"
  },
  {
    "skill_id": 64,
    "skills": "dynamodb",
    "demand_count": "27",
    "avg_salary": "138883"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "32",
    "avg_salary": "138569"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "32",
    "avg_salary": "138569"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "151",
    "avg_salary": "138518"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "139",
    "avg_salary": "138087"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "98",
    "avg_salary": "137707"
  },
  {
    "skill_id": 17,
    "skills": "typescript",
    "demand_count": "19",
    "avg_salary": "137207"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "93",
    "avg_salary": "136430"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "34",
    "avg_salary": "135499"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "30",
    "avg_salary": "134614"
  }
]*/