# Capstone Project Report – Education Spending and Student Outcomes

## Overview

This capstone project investigates the relationship between public school spending and academic performance, focusing on whether increased spending directly correlates with improved student outcomes. The analysis was motivated by policy debates in Idaho and nationwide, where claims about the impact of funding on education are often made without empirical support. The project uses historical data, excludes pandemic-era anomalies, and applies multiple statistical models to uncover actionable insights.

The entire capstone project was driven by me, followed closely by my mentor, and was fully approved by several SpringBoard data scientists.

## Concepts Explored

- **Research Question and Motivation:**  
  The central question is: *Does increased school spending directly correlate with improved academic performance?* Graduation rate was chosen as the primary metric for academic success, as it reflects the percentage of public high school freshmen graduating within four years.

- **Data Collection and Preparation:**  
  - Data on graduation rates and per-student expenditures was sourced from the National Center for Education Statistics (NCES).
  - Only data prior to 2020 was used to avoid distortions from the COVID-19 pandemic and federal relief funding.
  - Data cleaning involved removing unnecessary columns, correcting labels, and filling a small number of missing values with state means.
  - Spending was adjusted for inflation and normalized per student to ensure comparability across states and years.

- **Modeling and Analysis:**  
  - Four modeling approaches were tested to estimate trends and relationships:
    - **ARIMA** and **ETS** for time series forecasting of individual states.
    - **Linear Regression** and **Random Forest Regression** for analyzing trends and handling multiple states.
  - Idaho was used as a case study for detailed analysis.
  - Linear Regression and Random Forest models produced similar RMSE values, with Linear Regression closely matching actual outcomes and supporting multi-state analysis.

- **Findings:**  
  - Initial analysis showed a general trend: as spending increased, graduation rates tended to rise as well.
  - Some inverse relationships were observed in certain periods, suggesting the need for further investigation.
  - Changes in spending did not always lead to immediate or large changes in graduation rates, indicating a complex relationship.

## Lessons Learned

- **Data Quality and Scope:**  
  Excluding pandemic-era data was crucial for maintaining consistency and avoiding confounding variables.

- **Model Selection:**  
  Linear Regression provided robust, interpretable results for multi-state analysis, while Random Forest offered flexibility for more complex relationships.

- **Correlation vs. Causation:**  
  While a positive correlation was observed between spending and graduation rates, the analysis highlights that the relationship is not always straightforward and may be influenced by other factors.

- **Policy Relevance:**  
  Data-driven analysis is essential for informing education policy debates and moving beyond anecdotal claims.

## Conclusion

The capstone project demonstrates that increased education spending is generally associated with higher graduation rates, but the relationship is nuanced and context-dependent. Rigorous data cleaning, careful model selection, and exclusion of anomalous periods (like the pandemic) are vital for credible analysis. The findings support the use of empirical evidence in policy discussions about education funding and outcomes.
