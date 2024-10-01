# Titanic Dataset: Exploratory Data Analysis (EDA)

This project explores the Titanic dataset using **Python** and key data analysis libraries like **pandas**, **seaborn**, and **matplotlib**. The focus is on conducting exploratory data analysis (EDA) to understand the relationships between survival and various passenger attributes.

## Key Features
- **Data Cleaning**:
  - Imputed missing values in the `Age` column based on passenger class and gender using a custom function.
  - Dropped the `Cabin` column due to a high percentage of missing values.
  - Created dummy variables for categorical columns (`Sex` and `Embarked`).
- **EDA Visualizations**:
  - Heatmap to visualize missing data.
  - Count plots for survival rates based on gender and passenger class.
  - Distribution plots for age and fare.
  - Boxplots to analyze age distribution across passenger classes and gender.
  - Histograms and count plots for other features such as `SibSp` and `Fare`.

## Tools Used
- **Python**: pandas, seaborn, matplotlib, NumPy
