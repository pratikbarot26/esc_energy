# 🏠 Energy Consumption and Demand Prediction for eSC in South Carolina

## 🌟 Overview

This project was developed as part of the IST 687 - Introduction to Data Science course at Syracuse University to predict residential energy consumption in South Carolina during the peak summer month of July. The project aims to help ESC Electrical, a local electricity service provider, predict energy usage and avoid grid overload by leveraging machine learning models and analyzing data on weather, home characteristics, and energy consumption.

---

## 🎯 Objectives

- **🔮 Develop a Predictive Model to forecast residential energy consumption (heating and cooling) in South Carolina homes for the month of July.

- **🔍 Identify Key Drivers of energy usage by analyzing structured datasets including weather data, home characteristics, and energy usage.

- **📊 Deliver Visual Insights via an interactive Shiny application, enabling better decision-making and more effective energy management.

---

## 🗃️ Data Sources
The analysis utilizes three primary datasets:

1. 🏠 **Static House Data:**
Home attributes such as square footage, number of bedrooms, HVAC type, insulation type, and county location.

2. ⚡ **Energy Usage Data:**
Hourly consumption data for electricity, natural gas, propane, and energy used for heating and cooling.

3. 🌤️ **Weather Data:**
Hourly temperature, humidity, wind speed/direction data for South Carolina counties, crucial for understanding weather's effect on energy consumption.

---

## 🧪 Methodology

- 🧹 **Data Cleaning & Integration:**
  - Merged the three datasets (House, Energy Usage, and Weather) using the bldg_id (building ID) and timestamp as common identifiers.

- 🔍 **Exploratory Data Analysis (EDA):**
  - Analyzed trends in square footage, HVAC systems, and energy consumption.
  - Studied how weather conditions such as temperature, humidity, and wind speed affect energy consumption patterns, especially during the peak summer months.

- 🔮 **Predictive Modeling:**
  - Linear Regression: A baseline model used to predict energy consumption.
  - XGBoost: A more advanced model used for higher prediction accuracy.
  - Support Vector Machines (SVM): This model helps capture non-linear patterns and provides robust classification for predicting energy consumption categories. SVM was applied to evaluate its effectiveness in modeling energy usage patterns.

- 🚀 **Deployment:**
  - Built and deployed a Shiny App to visualize predicted vs actual energy consumption and to allow users to interact with the data in a dynamic environment.

---

## 🧠 Key Insights

- Cooling energy consumption increases significantly with rising temperatures, especially in July.
- HVAC efficiency, square footage, and number of occupants were found to be strong predictors of energy consumption.
- Weather data such as temperature and humidity also have a substantial impact on energy usage, with cooling energy consumption peaking during high-temperature periods.
- Predictive Model Performance:
  - Linear Regression (LR) achieved a high accuracy of 82.62% with an RMSE of 7.16, demonstrating a strong linear relationship between the predictors and target variable (energy consumption).
  - Support Vector Machines (SVM) showed an RMSE of 3.53. Despite being effective in handling non-linear patterns, this model showed a lower fit than Linear Regression for this particular dataset.
  - XGBoost yielded an RMSE of 15.04, which underperformed compared to the simpler Linear Regression model, indicating that XGBoost was overly sensitive to the dataset's parameters.

---

## 📊 Visualization Tool

The **Shiny App** provides the following interactive functionalities:
  - Visualization of Actual vs Predicted Energy Consumption for both heating and cooling, providing insights into model accuracy.
  - Interactive Filtering by Date: Users can filter data to focus on specific dates within the month of July, exploring energy consumption trends over time.
  - Weather-Consumption Correlation: Displays how different weather conditions (temperature, wind speed, etc.) affect energy usage.

**Link to Shiny App:** https://prbarot.shinyapps.io/eSC_finProj_Grp9/

---

## ✅ Recommendations

- **Encourage Solar Energy Adoption:** Promote the installation of solar panels as a renewable energy solution to reduce reliance on the grid, particularly during high-demand months like July.
- **Adopt Smart Energy Management Systems:** Encourage the use of smart thermostats and home automation systems to optimize heating and cooling based on real-time conditions.
- **Promote Energy-Efficient Appliances:** Recommend the use of energy-efficient HVAC systems, heat pumps, and insulation to minimize energy waste.
- **Implement Progressive Pricing Models:** Introduce tiered pricing, especially targeting middle-income households, to reduce energy consumption during peak periods. Higher consumption should incur higher rates to incentivize energy conservation.
- **Introduce an Even-Odd Rule for Energy Consumption:** Implement an even-odd energy consumption rule to balance energy demand during peak times and prevent overloading the grid.
- **Targeted Energy Conservation Strategies:** Focus efforts on reducing energy consumption during the high-demand month of July. Providing incentives for energy-efficient home improvements and promoting awareness can further reduce peak demand.
- **Sustainability and Environmental Impact:** By reducing overall energy consumption, ESC Electrical can significantly contribute to environmental sustainability efforts, minimizing the carbon footprint.

---

## 📌 Conclusion

This project provides ESC Electrical with a robust framework for forecasting residential energy consumption during peak summer months. The model’s insights, combined with the interactive Shiny app, offer a practical tool for energy providers to predict demand and avoid grid overload. The recommendations made here are designed to optimize energy consumption and reduce costs, contributing to a more sustainable and efficient energy management system.

---

## 🛠️ Technologies Used

- R: tidyverse, ggplot2, xgboost, shiny
- RStudio: Development environment for building models and the Shiny app
- Git/GitHub: Version control and collaboration
- Machine Learning: XGBoost, Linear Regression
- Data Visualization: Shiny for interactive dashboards
