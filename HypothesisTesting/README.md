# Hypothesis Testing

## Overview

This project investigates whether Apple Store apps receive better reviews than Google Play apps. It follows a complete data science workflow, from data sourcing and cleaning through hypothesis testing and interpretation. The analysis is conducted in a Jupyter notebook, simulating the kind of work performed by a professional data scientist.

## Concepts Explored

* **Data Science Pipeline**
  The project is structured around the core phases of the data science process: data sourcing, cleaning, transformation, visualization, modeling, and evaluation.

* **Data Sourcing and Loading**
  Datasets from the Apple Store and Google Play Store were obtained, loaded, and relevant columns were selected for analysis.

* **Data Cleaning and Transformation**

  * Data types were checked and corrected (e.g., converting prices and review counts to numeric types).
  * Inconsistent entries (such as a price labeled Everyone) were identified and removed.
  * Dollar symbols were stripped from price fields.
  * Missing values and apps with zero reviews were filtered out.
  * Both datasets were unified by standardizing column names and adding a `platform` column.

* **Data Visualization and Summarization**

  * The data was summarized by platform to compare app ratings.
  * Visual and analytical summaries were used to explore differences between platforms.

* **Hypothesis Testing**

  * Formulated and tested the hypothesis: Do Apple Store apps receive better reviews than Google Play apps?
  * Used permutation testing to assess the significance of observed differences in mean ratings.
  * Considered the distribution of ratings and the impact of platform on app reviews.

## Lessons Learned

* **Importance of Data Cleaning**
  Thorough cleaning is essential before analysis. Issues like non-numeric price values and missing data can significantly impact results.

* **Value of Data Integration**
  Combining datasets from different sources requires careful alignment of columns and consistent labeling, such as adding a `platform` identifier.

* **Statistical Thinking**
  Observed differences in means do not automatically imply statistical significance. Permutation testing provided a robust way to assess whether the observed difference in app ratings could have occurred by chance.

* **Critical Interpretation**
  Even when a difference is observed, it's important to evaluate its practical significance and consider alternative explanations or additional models.

* **Reproducibility and Documentation**
  Clear, step-by-step documentation and code make the analysis understandable and reproducible for others.

## Conclusion

Through this project, I gained hands-on experience with the full data science workflow, deepened my understanding of hypothesis testing, and learned the importance of rigorous data cleaning and thoughtful interpretation. The project demonstrates how to answer a real-world business question using statistical analysis and Python data science tools.
