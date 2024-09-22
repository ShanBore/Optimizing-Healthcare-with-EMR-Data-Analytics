<h1>Optimizing Healthcare with EMR Data Analytics</h1>
Link to Dashboard: https://app.powerbi.com/view?r=eyJrIjoiZWIxZTY5MjktMTEwYy00MGQyLWJhNjEtMGIzMDA2MzVjMTBiIiwidCI6ImFjNzllNWE4LWUwZTQtNDM0Yi1hMjkyLTJjODliNWMyODM2NiIsImMiOjF9

## Background and Overview
This project leverages synthetic Electronic Medical Records (EMR) data to extract actionable insights into patient care, operational efficiency, and financial performance. The data was processed using Python for exploratory data analysis (EDA), MS SQL Server for data cleaning and transformation, and Power BI for interactive dashboard development.

The analysis focuses on key areas such as patient outcomes, cost management, readmission rates, and resource allocation, helping hospital administrators make informed, data-driven decisions. Insights and recommendations are provided on the following key areas:

Readmission rates and high-risk patient groups

Departmental performance, patient satisfaction, and operational efficiency

Financial trends, revenue opportunities, and insurance coverage

## Data Structure Overview
Synthetic Data Generation: Due to privacy regulations like HIPAA, the project used synthetically generated EMR data (via Python’s Faker library) to simulate real-world patient records.

Key Data Fields:

Patient Demographics: Age, gender, race

Vital Signs: Blood pressure, heart rate, glucose levels

Diagnoses: ICD-10 codes

Procedures: CPT codes for surgeries

Insurance Coverage: Treatment costs, patient satisfaction scores

Readmission Info: Indicators of patient readmissions

This synthetic data mimicked real hospital scenarios to provide a framework for insights without using sensitive patient data.

## Executive Summary
Overview of Findings
Key metrics and trends were uncovered:

Patient Readmission Rates: 1 in 3 adults with diabetes (ICD-10 E11.9) were readmitted within two months, indicating high-risk groups that require better post-discharge care.

Revenue Trends: ER and Orthopedics departments generated the highest revenue per patient, especially from seniors and adults.

Operational Efficiency: Cardiology, Oncology, and Pediatrics experienced peak activity in specific months (March, June, July, and February), signaling the need for strategic resource allocation during these periods.

Trends
Chronic Conditions: Chronic conditions like diabetes and heart disease showed an upward trend in summer months, offering opportunities for preventive care programs.

Patient Satisfaction Decline: Orthopedics saw a significant drop in patient satisfaction post-July 2024, likely due to resource strain and operational inefficiencies.

Insurance Coverage Gaps: Over 10% of patients were uninsured, with private insurance covering 40% of patients, presenting a gap in patient access to care.

Performance
Department Efficiency: Oncology and ER departments had high readmission rates, leading to lower patient satisfaction.

Revenue Per Patient: ER and Orthopedics showed the highest revenue per patient, driven by specialized care and advanced surgical options.

## Insights Deep Dive
Insight 1: Patient readmission rates for diabetes (ICD-10 E11.9) are high, with 1 in 3 adults being readmitted within two months. This suggests that post-discharge care, education, and at-home monitoring are critical to reducing preventable readmissions.

Insight 2: Cardiology, Oncology, and Pediatrics departments experience peak activity during specific months (March, June, July, and February). This presents an opportunity to strategically allocate resources during these periods to improve operational efficiency and reduce patient wait times.

Insight 3: Orthopedics patient satisfaction has declined significantly since July 2024. This drop is likely due to a combination of high patient volume and resource strain, requiring improvements in service quality, communication, and facility upgrades.

Insight 4: ER and Oncology departments generated lower patient ratings, likely due to higher readmission rates and treatment costs. Enhancing discharge processes and post-treatment follow-up care could improve both patient satisfaction and outcomes.

Insight 5: Over 10% of patients were uninsured, with private insurance covering 40%. Expanding financial assistance programs and negotiating better insurance coverage could improve patient access to care and reduce financial barriers.

## Recommendations
Improve Follow-Up Care for High-Risk Patients: Reducing readmission rates for chronic conditions like diabetes (ICD-10 E11.9) can be achieved by implementing targeted follow-up programs. By reducing readmissions by 10%, the hospital could save significant costs while improving patient outcomes.

Strategic Resource Allocation: Cardiology, Oncology, and Pediatrics departments need additional resources during peak months (March, June, July, February) to maintain efficiency. By reallocating 5% of staffing resources during these months, the hospital can reduce patient wait times and improve service delivery.

Upgrade Orthopedics Department: Given the 10% drop in patient satisfaction since July 2024, improvements in patient communication, service delivery, and facilities could reverse this trend. Increasing satisfaction by 10% could boost patient retention and drive further revenue growth in Orthopedics.

Reduce Readmission Rates in ER and Oncology: Investing in better discharge procedures and follow-up care for ER and Oncology patients can improve satisfaction scores and reduce readmission rates. By lowering readmissions by 5%, the hospital can significantly cut costs and improve patient outcomes.

Expand Insurance Coverage and Financial Assistance: Negotiating better deals with insurance providers and expanding financial assistance programs can increase the number of insured patients by 10%, improving patient access to care while boosting hospital revenue.



The Power BI dashboard enables continuous monitoring of key metrics, offering hospital staff a dynamic tool for making informed decisions that improve both clinical outcomes and operational efficiency. The recommendations provided aim to enhance patient satisfaction, reduce readmissions, and grow revenue through strategic initiatives.
