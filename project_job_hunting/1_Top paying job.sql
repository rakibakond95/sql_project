/*
Question: What are the top-paying data engineer jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

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

/* Here are the insights from the **salary\_year\_avg** column of your dataset:

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

Would you like me to make a **visual plot (like histogram or boxplot)** of these salaries to see the distribution more clearly?

Result
====
[
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-01-27 18:10:51",
    "company_name": "Engtal"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "325000.0",
    "job_posted_date": "2023-02-17 18:11:49",
    "company_name": "Engtal"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-07-17 11:10:55",
    "company_name": "Durlston Partners"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "251000.0",
    "job_posted_date": "2023-01-30 11:07:32",
    "company_name": "Twitch"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-24 23:32:42",
    "company_name": "AI Startup"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-02-14 15:24:07",
    "company_name": "Signify Technology"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "250000.0",
    "job_posted_date": "2023-03-28 13:11:42",
    "company_name": "Signify Technology"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-05-25 15:05:38",
    "company_name": "Movable Ink"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "245000.0",
    "job_posted_date": "2023-01-08 15:05:16",
    "company_name": "Handshake"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "242000.0",
    "job_posted_date": "2023-12-08 14:04:41",
    "company_name": "Meta"
  }
]
 */