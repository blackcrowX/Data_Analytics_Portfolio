<h1 align="center">Car Insurance Claim Fraud</h1>

<p align="center">
  <img width="273px" src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/icons/ms-excel.png"/>
</p>

This project is an analysis in Microsoft Excel to gain insights into car insurance claim fraud. It contains the processes of data preparation, data modelling, data validation, data visualisation and data analysis. It showcases the use of advanced skills such as PowerQuery, PowerPivot, PivotTable, PivotChart and Regression-Analysis.

**File:** [`Insurance-Claims.xlsx`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/Insurance-Claims.xlsx)


## Table of Contents
- [Case](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#case)
- [Data](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#data)
- [Preparation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#preparation)
- [Modelling](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#modeling)
- [Validation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#validation)
- [Visualisation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#visualisation)
- [Result](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#result)


## Case

Insurance fraud is a huge problem in the industry and it's difficult to identify fraudulent claims. My goal was to help an insurer understand what the main characteristics of fraudulent claims are and visualize the findings. Furthermore, the insurer wanted to know if there was a correlation with the months as customer. This resulted in following questions for me:

1.  Which state has the highest total of fraudulent claims?

2.  What are common properties of insured who committed fraud?

3.  What is the most common choice of incident for fraudulent claims?

4.  Is there a correlation between the month as customer and if a claim is fraudulent?

By answering these questions, I will be able to help the insurer gain insights into fraudulent claims and what their statistical properties are.


## Data

The data contains records on fraudulent and non-fraudulent car insurance claims from the 1st of January 2015 till the 28th of February 2015. The CSV file columns are separated into various information regarding the policy, the insured, the incident, the resulting claims made and if the claim was fraudulent.

**Data:** [`insurance-claims.csv`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/insurance-claims.csv)

**Source:** [`Databricks Inc.`](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/4954928053318020/1058911316420443/167703932442645/latest.html)


## Preparation

To start the data preparation the CSV file was opened via PowerQuery and the initial data cleaning was also processed via PowerQuery. 

<p align="center">
  <img src="https://i.postimg.cc/t90wXBJ8/Screenshot-3.jpg"/>
  <em>Fig 1. This image shows the data loaded in PowerQuery.</em>
</p>

First the columns were reorganised. This resulted in the "Policy Number" becoming the Index. Then the excess column at the end of the data was deleted and a new column named "Age Group" was created. Afterwards the data was updated to be more interpretable via `replace()` and `proper()`. For example, the value "Husband" and "Wife" for the column "Insured Relationship" were both changed to "Married". These steps were to achieve better visualisation of the data.

The last step involved checking the data for missing values, duplicates or inconsistent entries. In this case there were no missing value, duplicates or inconsistent entries. This was achieved by using `countif()` and `replace()`. It's purpose was to avoid potential errors and biases in the data. This results in a more accurate analysis later.

<p align="center">
  <img src="https://i.postimg.cc/QXx9x44g/Screenshot-7.jpg"/>
  <em>Fig 2. This image shows the data afterwards in Excel.</em>
</p>


## Modelling

To start the modelling process I opened the prepared table with PowerPivot to segment it.

<p align="center">
  <img src="https://i.postimg.cc/PthSdhzN/Screenshot-11.jpg"/>
  <em>Fig 3. This image shows the table in PowerPivot.</em>
</p>

First the data was segmented into customers based on their age, education, gender, occupation and relationship. The data then was further segmented into incidents by bodily injuries, property damage, severity, time, type and vehicles involved. The last two segments involved the claims date and policy state for further information to the data. 

Then using PivotTable, I created fourteen tables using the total claims/ amount of claims as table-value and segmented properties as table-row. The resulting tables were used to create charts using PivotChart. The purpose of this segmentation was to further drill into the data and answer the question resulting from the initial issue.

<p align="center">
  <img src="https://i.postimg.cc/33TSgRKr/Screenshot-14.jpg"/>
  <em>Fig 4. This image shows the different pivot tables.</em>
</p>

The charts were already able to answer basic questions regarding the data. For example, the bar chart regarding the insured hobbies indicates that chess and cross fit enthusiasts in the fraudulent dataset have a higher rate of committing car insurance claim fraud compared to the non-fraudulent dataset. These charts will make the visualisation on the points of interest later more responsive for the viewer.

<p align="center">
  <img src="https://i.postimg.cc/Vs2TyWQX/Screenshot-13.jpg"/>
  <em>Fig 5. This image shows the different pivot charts.</em>
</p>

The last step involved solving the final question of the correlation between month as customer and fraudulent claims. I used the regression analysis to calculate the variable Multiple R for the fraudulent data. Multiple R was 0,1565 and there is no statistical correlation between the months as customer and the amount of claims in the data. With help of the regression analysis you can get a better view over the statistical means regarding the data and gain further insights into the variance of the data.

<p align="center">
  <img src="https://i.postimg.cc/wqVdTzvF/Screenshot-9.jpg"/>
  <em>Fig 6. This image shows the correlation analysis between months as customer and fraudulent claims made.</em>
</p>


## Validation

The data was checked for correct typing and a correct data range with no abnormalities. Furthermore the data was checked for correct formatting and consistency in the data entered. this was achieved by the filters in the data table. Last but not least the data was checked for presence, meaning there are no blank spaces in the data viewed. 


## Visualisation

I created a new excel sheet for to visualise all the charts on a dashboard. This makes it easy to view all the modelled information at once. Then I added slicers to the dashboard. This allows for further filtering of the data based on different criteria and the interests of the viewer. All these features make it easier to answer the initial issue regarding car insurance claim fraud, while not being overwhelmed by the data.

<p align="center">
  <img src="https://i.postimg.cc/9MdxwqnN/Screenshot-7.jpg"/>
  <em>Fig 7. This image shows the dashboard for car insurance claim fraud.</em>
</p>

## Result

Using the modelled data in the dashboard, I was able to answer the initial questions and provide insights on car insurance claim fraud as following:

- State:  The state with the most committed frauds is Ohio. There appear to be slight irregularity compared to the non-fraudulent dataset with to 36.6 to 34.5% and could be a simple difference in the sample of data. An actionable insight would be to nevertheless keep an eye out for claims made from policies in Ohio.

- Insured:  The largest group of insured persons who committed fraud falls within the middle age range of 35-44 and are single. Here men on the one hand and people with a doctor’s degree on the other hand have a higher tendency to be prone to commit fraud. The big surprise lies in the large amount of insured in the fraudulent dataset who enjoy chess or cross fit as hobbies. It's also the case for men in an executive managerial occupation and women with a sales occupation. All four of these properties have a way higher percentage of amount of claims in the fraudulent dataset compared to the data of non-fraudulent dataset. Resulting in an advice to be more aware with claims from these insured with these properties.

- Incident:  Many incidents involving fraud happen at midday and were single vehicle collisions involving major damages. The amount of major damages relatively compared to the data of insured who didn't commit crime is way larger with 69% to 14% and is the preferred incident type. Also, the data indicates that a parked car or vehicle theft is a very uncommon occurrence as an incident type for car insurance claim fraud. These insights should help with recognizing fraudulent claims more easily.

- Correlation:  With help of the regression analysis I was able to prove that there was no correlation between month as customer and fraudulent claims. An insight to take with would be to further strengthen longevity in the contracts, because the regression anlysis predicts the fraudulent claims to be lower with higher months as customer. This can very well be the result of not enough polcies spanning the total time amount we looked at. This is hard to say with the given data.
