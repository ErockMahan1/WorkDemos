# Investigating the Impact of School Funding on Academic Performance

## Overview

This project explores the relationship between school funding and academic performance, focusing on whether increased spending per student correlates with improved graduation rates. The intend of this study is to provide data-driven insights and actionable recommendations for policymakers and inform voters, especially in states like Idaho where education budgets are under review.

---

## Background & Motivation

School funding is a critical and contentious issue in the United States. Any discussion about potentially lowered school budgets is shouted down as irresponsible, as it will necessarily lead to lower academic performance. This analysis aims to clarify:

- **Primary Question:**
  - Does increased school spending directly correlate with improved academic performance (specifically, graduation rates)?
- **Secondary Question:**
  - Which states outperform or underperform relative to their funding levels?
---

## Research Objectives

- Evaluate the correlation between per-student funding and graduation rates across states.
- Provide evidence-based recommendations for funding allocation.
- Identify high-impact investment areas to maximize student success.
  
---

## Methodology

### Data Sources

- **Performance Metrics:** State-level graduation rates (Adjusted Cohort Graduation Rate, ACGR) from the National Center for Education Statistics (NCES).
- **Funding Data:** Per-student expenditure totals, adjusted for inflation using the Consumer Price Index (CPI).

### Data Preparation

- Data from 2011–2019 was used to avoid pandemic-related anomalies.
- Missing values were imputed with state means.
- Spending figures were inflation-adjusted and standardized to a school-year basis.

### Analysis Approach

- **Correlation Analysis:** Examined the relationship between funding and graduation rates using Pearson’s correlation coefficient.
- **Predictive Modeling:** Tested ARIMA, ETS, Linear Regression, and Random Forest Regression models.
    - Linear Regression and Random Forest were selected for their accuracy and ability to handle multi-state data.

---

## Key Findings

- **Correlation Results:**  
  - Pearson r = 0.02823 (very weak correlation)
  - p-value ≈ 0.00005 (statistically significant but not practically meaningful)
- **Visualization:**  
  - No consistent relationship between increased spending and higher graduation rates, both across and within states.
  - States with the highest spending (e.g., D.C.) do not necessarily have the highest graduation rates.
  - States increasing or decreasing spending did not see corresponding changes in graduation rates.
- **State Highlights:**  
  - **Best Predicted Graduation Rate:** West Virginia (97.20%)
  - **Lowest Predicted Graduation Rate:** New Mexico (77.87%)

---

## Conclusions

- **No evidence of a meaningful correlation** between per-student spending and graduation rates.
- **Policy Recommendation:** Adjusting funding alone is unlikely to impact graduation rates significantly.
- **Further Research:** Analyze policy and procedural differences between high- and low-performing states for actionable insights.

---

## Limitations & Future Research

- **Quality of Education:** Graduation rates do not reflect educational quality or consistency of standards across states.
- **Data Scope:** Unclear if private/homeschool students are included; rural economic factors may skew graduation rates.
- **Pandemic Effects:** Post-2019 data excluded to avoid confounding variables from COVID-19-related disruptions.

---

## Proposals for Future Research

- Investigate the comparability of graduation standards across states.
- Clarify the inclusion of private and homeschooled students in reported graduation rates.
- Examine socioeconomic and demographic factors influencing graduation rates beyond funding levels.

---

## Contact

For questions or collaboration, please open an issue or submit a pull request.


