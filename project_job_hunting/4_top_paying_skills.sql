/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

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

/* 
Here's a concise analysis you can directly use or adapt for your **GitHub README**:

---

## 💸 Top-Paying Skills for Data Engineers (LinkedIn 2023)

Based on average salary data from LinkedIn job postings, the following skills are associated with **the highest-paying roles in Data Engineering**:

---

### 🔝 **Top Insights**

#### 1. **Niche & Low-Supply Skills = High Pay**

* **Assembly (\$192.5K)**, **Rust (\$172.8K)**, **Clojure (\$170.8K)**, and **Julia (\$160.5K)** stand out — they’re rare in data engineering but highly paid where used (e.g., for performance-critical systems or research-heavy roles).

#### 2. **Specialized Databases Pay Well**

* Skills like **MongoDB (\$182.2K)**, **Neo4j (\$166.5K)**, **Cassandra (\$151.2K)**, and **Redis (\$157K)** suggest that **NoSQL and graph databases** are in demand for high-complexity data applications.

#### 3. **Emerging Tech Has Premium Pay**

* **Solidity (\$166.2K)** and **GraphQL (\$162.5K)** are modern, web3 and API-layer technologies — not core to all data teams, but highly paid in startups and frontier tech.

#### 4. **ML & Data Science Tools Also Appear**

* Tools like **ggplot2 (\$176.2K)**, **NumPy (\$157.6K)**, and **MXNet (\$157.5K)** show up — suggesting that hybrid **data engineer + data scientist** roles can offer high salaries.

#### 5. **Platform & Infra Skills Are Valuable**

* **Kubernetes (\$158.2K)**, **Kafka (\$150.5K)**, **VMware (\$150K)** — backend, orchestration, and streaming tech are key to scaling data systems.

---


> 💼 The highest-paying data engineering roles tend to value:
>
> * **Low-supply programming languages** (e.g., Assembly, Rust, Clojure)
> * **Specialized or non-relational databases** (MongoDB, Neo4j, Cassandra)
> * **Cloud-native + distributed systems** (Kubernetes, Kafka)
> * **Cross-disciplinary tools** from ML, DevOps, or Web3 domains
Result
====

[
  {
    "skills": "assembly",
    "avg_salary": "192500"
  },
  {
    "skills": "mongo",
    "avg_salary": "182223"
  },
  {
    "skills": "ggplot2",
    "avg_salary": "176250"
  },
  {
    "skills": "rust",
    "avg_salary": "172819"
  },
  {
    "skills": "clojure",
    "avg_salary": "170867"
  },
  {
    "skills": "perl",
    "avg_salary": "169000"
  },
  {
    "skills": "neo4j",
    "avg_salary": "166559"
  },
  {
    "skills": "solidity",
    "avg_salary": "166250"
  },
  {
    "skills": "graphql",
    "avg_salary": "162547"
  },
  {
    "skills": "julia",
    "avg_salary": "160500"
  },
  {
    "skills": "splunk",
    "avg_salary": "160397"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "160333"
  },
  {
    "skills": "zoom",
    "avg_salary": "159000"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "158190"
  },
  {
    "skills": "numpy",
    "avg_salary": "157592"
  },
  {
    "skills": "mxnet",
    "avg_salary": "157500"
  },
  {
    "skills": "fastapi",
    "avg_salary": "157500"
  },
  {
    "skills": "redis",
    "avg_salary": "157000"
  },
  {
    "skills": "trello",
    "avg_salary": "155000"
  },
  {
    "skills": "jquery",
    "avg_salary": "151667"
  },
  {
    "skills": "express",
    "avg_salary": "151636"
  },
  {
    "skills": "cassandra",
    "avg_salary": "151282"
  },
  {
    "skills": "unify",
    "avg_salary": "151000"
  },
  {
    "skills": "kafka",
    "avg_salary": "150549"
  },
  {
    "skills": "vmware",
    "avg_salary": "150000"
  }
] */