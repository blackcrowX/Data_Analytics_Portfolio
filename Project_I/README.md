<div align="center">
  <h1>Car Insurance Claims Fraud</h1>
  <img width="200px" src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/icons/ms_excel.png"/>
</div>

This project utilizes Microsoft Excel for comprehensive analysis of car insurance claims fraud data. The dataset includes various details regarding the policy, policy holder and incident. Key findings highlight a correlation between the insured hobbies chess and crossfit with the likelihood fraudulent claims and a correlation between women in sales occupation and the likelihood fraudulent claims.

## Table of Contents
- [Introduction](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#Introduction)
- [Objective](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#Objective)
- [Dataset](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#Dataset)
- [Preparation](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#preparation)
- [Modeling](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#modeling)
- [Validation](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#validation)
- [Visualisation](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#visualisation)
- [Analysis](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#analysis)
- [Conclusion](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/README.md#Conclusion)

## Introduction
This project undertakes a comprehensive analysis of car insurance claims fraud using Microsoft Excel, aiming to uncover valuable insights. The analysis workflow includes essential stages such as data preparation, data modeling, data validation, data visualisation, and data analysis. Furthermore, to facilitate effective communication of the findings, compelling visualisations and analytical models have been developed within Excel. These tools provide an intuitive and user-friendly platform for exploring and interpreting the analyzed data, enhancing the accessibility and usability of the insights gained from the Excel analysis.

**Project File:** [`Dashboard_Car_Insurance_Claims.xlsx`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_I/Car_Insurance_Claims.xlsx)

## Objective

Insurance fraud poses significant challenges within the industry, making the identification of fraudulent claims a complex task. In this project, our objective is to assist an insurer in gaining a deeper understanding of the key characteristics associated with fraudulent claims and visually represent the findings. Additionally, we aim to determine if a correlation exists between the duration of the policyholder's tenure and the likelihood of a fraudulent claim. To address these objectives, the following pivotal questions guide our analysis:

1. Which state exhibits the highest aggregate of fraudulent claims?
2. What are the common attributes among policyholders who engage in fraudulent activities?
3. Which type of incident is most frequently associated with fraudulent claims?
4. Is there a discernible correlation between the duration of the policyholder's tenure and the likelihood of fraudulent claims?


## Dataset

The dataset used in this project comprises records of car insurance claims from January 1, 2015, to February 28, 2015. It provides comprehensive information about policy details, insured individuals, incident characteristics, claim details, and whether each claim is fraudulent or not. The dataset was obtained from Databricks Inc.

**Data File:** [`car-insurance-claims.csv`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/car-insurance-claims.csv)

**Data Source:** [Databricks Inc.](https://www.databricks.com/)

## Data Preparation

The data preparation stage for this Excel project commenced by opening the CSV file using PowerQuery, enabling seamless integration of the dataset into the analysis workflow. PowerQuery was further utilized to execute preliminary data cleaning operations, ensuring the data's integrity and reliability.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_I/screenshot_1.jpg"/>
  <em>Figure 1: Data Loaded in PowerQuery</em>
</p>

To begin, a reorganization of the columns was undertaken, enhancing the data's structure and readability. As part of this process, the "Policy Number" column was designated as the index for efficient referencing. Additionally, an extraneous column at the end of the dataset was removed to streamline the data's presentation. Moreover, a new column called "Age Group" was introduced, facilitating subsequent analysis based on age-related criteria.

Subsequently, efforts were made to improve data interpretability through the application of functions such as replace() and proper(). For instance, the values "Husband" and "Wife" within the "Insured Relationship" column were unified and transformed into a more generic category, "Married". These transformations aimed to enhance the visualisation of the data and simplify the subsequent analytical processes.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_I/screenshot_2.jpg"/>
  <em>Figure 2: Data in Excel After Transformation</em>
</p>

The final step in the data preparation phase involved a thorough examination for missing values, duplicates, or inconsistencies within the dataset. In this particular project, the data proved to be free from such issues, bolstering the overall data quality and ensuring a robust analysis. The assessment was performed using the countif() function, mitigating the potential risks of errors and biases that could arise from incomplete or inconsistent data entries. This meticulous verification process lays the foundation for accurate and reliable analysis in subsequent stages.

## Modeling

To commence the data modeling process in Excel, I utilized PowerPivot to segment the prepared table and facilitate in-depth analysis. The segmentation began by dividing the data into distinct customer segments based on age, education, gender, occupation, and relationship. Furthermore, the data was segmented into incidents, encompassing categories such as bodily injuries, property damage, severity, time, type, and vehicles involved. Additionally, two additional segments were created to capture information related to claim dates and policy states, providing further contextual details for the analysis.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_I/screenshot_3.jpg"/>
  <em>Figure 3: Table in PowerPivot</em>
</p>

Next, leveraging the power of PivotTable, I generated fourteen tables that utilized the total claims or claim amounts as table values and the segmented properties as table rows. These tables served as the foundation for creating informative charts using PivotChart. This segmentation strategy allowed for a deeper exploration of the data, enabling insights into the initial research question.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_I/screenshot_4.jpg"/>
  <em>Figure 4: Various Pivot Tables Displayed</em>
</p>

The resulting charts provided initial insights into the dataset, addressing fundamental inquiries. For instance, an examination of the bar chart on insured hobbies revealed that individuals engaged in chess and cross fit activities exhibited a higher tendency to commit car insurance claim fraud compared to non-fraudulent cases. These visually appealing charts served as an effective tool for highlighting points of interest and enhancing data visualisation for viewers.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_I/screenshot_5.jpg"/>
  <em>Figure 5: Pivot Charts Showcasing Data Variations</em>
</p>

The final step focused on addressing the correlation between the duration of policyholders' tenure and the occurrence of fraudulent claims. To accomplish this, I employed regression analysis to calculate the Multiple R variable for the fraudulent data. The resulting Multiple R value was 0.1565, indicating no statistical correlation between the duration of policyholders' tenure and the number of claims in the dataset. The utilization of regression analysis provided a comprehensive statistical perspective, enabling a deeper understanding of the data's variability and facilitating further insights.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_I/screenshot_6.jpg"/>
  <em>Figure 6: Correlation Analysis of Months as Customer and Fraudulent Claims</em>
</p>

By following this data modeling process, a thorough analysis was conducted using PowerPivot and PivotTable functionalities in Excel. The segmentation, creation of tables, charts, and regression analysis collectively contributed to uncovering valuable insights, addressing the research questions, and enriching the overall understanding of the car insurance claim dataset.

## Validation

During the data validation phase of the Excel project, rigorous checks were performed to ensure the accuracy, completeness, and consistency of the dataset. Several key aspects were considered to ensure the data's integrity and reliability.

Firstly, careful scrutiny was applied to verify the correctness of data typing and the adherence to appropriate data ranges. This entailed examining the data to confirm that each value was assigned to the correct data type (e.g., numeric, text, date) and fell within the expected range of values. Any anomalies or inconsistencies in data typing and ranges were flagged for further investigation and correction.

Additionally, attention was given to the correct formatting and consistency of the entered data. The data was meticulously reviewed to ensure that it followed consistent formatting guidelines, such as date formats, decimal places, and alphanumeric representations. Inconsistencies in formatting were identified and rectified to maintain uniformity throughout the dataset.

The utilization of filters within the data table played a crucial role in the validation process. By applying filters, the data was examined to identify any irregularities, outliers, or discrepancies that may require attention. This allowed for a comprehensive assessment of the dataset's consistency, enabling the identification and resolution of any issues that could impact the accuracy or interpretation of the data.

Finally, a vital aspect of the data validation process involved checking for the presence of any blank spaces or missing values in the viewed data. The dataset was thoroughly examined to ensure that no essential information was missing or obscured by blank entries. Any instances of missing data were noted and addressed to maintain the completeness and reliability of the dataset.

By executing these comprehensive data validation measures, the project ensured that the dataset was free from abnormalities, maintained consistent formatting, and contained no missing values. This robust validation process bolstered the reliability and accuracy of the data, laying the foundation for accurate analysis and informed decision-making.


## Visualisation

The data visualisation stage of the Excel project involved transforming the analyzed information into meaningful and easily understandable visual representations. This allowed for a comprehensive overview of the modeled data on a dedicated dashboard, enhancing the viewer's ability to gain insights efficiently. Several key steps were taken to achieve this goal.

To begin, a new Excel sheet was created specifically for the purpose of visualizing the data. This dedicated sheet served as the canvas for assembling various charts, tables, and visual elements, consolidating all the modeled information in a single, easily accessible location. This approach ensured that viewers could review the data at a glance, enabling a holistic understanding of the analysis outcomes.

To enhance interactivity and provide viewers with more control over the data exploration process, slicers were incorporated into the dashboard. Slicers function as interactive filters that allow for further data segmentation based on different criteria and the specific interests of the viewer. By utilizing slicers, viewers can dynamically adjust the displayed data, focusing on specific subsets or dimensions of the analysis that are most relevant to their investigation.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_I/screenshot_7.jpg"/>
  <em>Figure 7: Car Insurance Claim Fraud Dashboard Visualisation</em>
</p>

These features collectively contribute to a more intuitive and user-friendly data visualisation experience. By presenting the analyzed information on a dedicated dashboard, viewers can quickly grasp the key insights and trends without feeling overwhelmed by the complexity of the underlying data. The inclusion of slicers adds an extra layer of interactivity, enabling viewers to explore the data from different angles and refine their analysis based on specific filters of interest.

Through this data visualisation process, the Excel project successfully addresses the initial research question regarding car insurance claim fraud. The consolidated dashboard and interactive slicers empower viewers to effortlessly navigate through the modeled data, facilitating a comprehensive understanding of the analysis outcomes while ensuring a streamlined and engaging data exploration experience.

## Analysis

Using the modelled data in the dashboard, I was able to answer the initial questions and provide insights on car insurance claim fraud as following:

- **State:** The state of Ohio stands out as having the highest occurrence of fraudulent claims. Although the difference between the fraudulent and non-fraudulent datasets is relatively minor (36.6% versus 34.5%), it is worth monitoring claims originating from policies in Ohio for potential irregularities.

- **Insured:** The analysis reveals that individuals in the age range of 35-44, particularly those who are single, constitute the largest group involved in fraudulent activities. Notably, males and individuals with a doctor's degree exhibit a higher propensity for fraudulent claims. Surprisingly, individuals with interests in chess or cross fit, along with men in executive managerial positions and women in sales occupations, show significantly higher claim rates in the fraudulent dataset compared to the non-fraudulent dataset. These observations suggest the need for increased scrutiny when assessing claims from insured individuals with these characteristics.

- **Incident:** The analysis highlights that a considerable number of fraudulent incidents occur during midday, primarily involving single-vehicle collisions resulting in substantial damages. Major damages account for a significantly higher percentage (69%) in the fraudulent dataset compared to the non-fraudulent dataset (14%). Additionally, incidents involving parked cars or vehicle theft are relatively rare in cases of car insurance claim fraud. These insights can aid in the identification of potentially fraudulent claims.

- **Correlation:** Through regression analysis, it was determined that there is no statistically significant correlation between the duration of policyholders' tenure (months as a customer) and the occurrence of fraudulent claims. However, it is worth noting that the analysis suggests a lower predicted frequency of fraudulent claims with longer customer tenure. This finding may be influenced by the limited number of policies spanning the observed time period, and caution should be exercised when interpreting this relationship based on the available data.

These data analysis findings provide valuable insights into the characteristics and patterns associated with car insurance claim fraud. The identified trends and relationships offer actionable recommendations for heightened vigilance when handling claims from specific states, insured individuals with certain profiles, and incidents displaying particular patterns. The analysis contributes to a better understanding of fraudulent claims and supports decision-making processes aimed at detecting and mitigating insurance fraud.

## Conclusion

In conclusion, this project successfully analyzed car insurance claim fraud using Microsoft Excel, leveraging advanced techniques such as PowerQuery, PowerPivot, PivotTable, PivotChart, and Regression Analysis. By investigating key indicators and patterns associated with fraudulent claims, insurance companies can enhance their fraud detection and prevention strategies.

Moving forward, several areas warrant further exploration:

1. **Develop advanced predictive models:** Utilize machine learning algorithms and techniques to build predictive models that can accurately detect fraudulent claims in real-time.

2. **Expand the dataset:** Incorporate a larger and more diverse dataset to increase the robustness and generalizability of the analysis.

By pursuing these next steps, insurance companies can further strengthen their ability to identify and mitigate car insurance claim fraud, ultimately minimizing financial losses and improving customer trust.
