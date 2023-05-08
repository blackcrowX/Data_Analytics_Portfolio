<h1 align="center">Car Insurance Claims Fraud</h1>

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/excel-file.png"/>
</p>

## About

This project is an analysis in Microsoft Excel to gain insights into fraudulent car insurance claims. It contains the processes of data preparation, data modeling, data validation and data visualisation. It showcases the use of advanced skillS such as PowerQuery, PowerPivot, PivotTables, PivotCharts and Regressionanalysis.

**Code:** [`Insurance-Claims.xlsx`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/Insurance-Claims.xlsx)

## Table of Contents
- [About](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#about)
- [Case](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#case)
- [Data](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#data)
- [Preparation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#preparation)
- [Modeling](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#modeling)
- [Validation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#validation)
- [Visualisation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#visualisation)
- [Result](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/readme.md#result)

## Case

Insurance fraud is a huge problem in the industry and it's difficult to identify fraud claims. Our goal was to help an insurer gain insights into the fraudulent claims and visualize our findings. This resulted in following questions for us:

1. Which state has the highest total of fraudulent claims?
2. What are common qualities of insured persons who committed fraud?
3. What is the most common choice of incident for the comitted fraud?
4. Is there a correlation between the month as as customer and if a fraud was comitted?

By answering these questions, we can help the insurer gain insights into the fraudulent cases and which claims to double-check in the future.

## Data

The data contains records on fraudulent car insurance claims from the 1st of January till the 1st of March 2015. The csv file columns are seperated into various informations regarding the policy, the insured person, the incident, the resulting claims made and if the claim was fraudulent.

**Data:** [`insurance-claims.csv`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-I/insurance-claims.csv)

**Source:** [`Databricks Inc.`](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/4954928053318020/1058911316420443/167703932442645/latest.html)

## Preparation

The CSV data file was openend and data cleaning was performed via PowerQuery. This was to ensure accurate analysis and better visualisation later on.


<p align="center">
  <img src="https://i.postimg.cc/t90wXBJ8/Screenshot-3.jpg"/>
  Fig 1. This image shows the data loaded in PowerQuery.
</p>


First the columns were reorganised resulting in the "Policy Number" becoming the Index. Then the excess column at the end of the data was deleted and a new column named "Age Group" was created. Then the data was updated to be more interpretable via the replace-function and proper-function. For Example the value "Husband" and "Wife" for the column "Insured Relationship" were changed to "Married". These steps were to better visualise the data.

Afterwards the data was checked for mising values and existing duplicates. In this case there were no missing values or duplicates. This was to avoid potential errors and biases in the data.


<p align="center">
  <img src="https://i.postimg.cc/QXx9x44g/Screenshot-7.jpg"/>
  Fig 2. This image shows the data afterwards in Excel.
</p>


## Modeling

To start the modeling process I opened the table with PowerPivot to segment it.


<p align="center">
  <img src="https://i.postimg.cc/PthSdhzN/Screenshot-11.jpg"/>
  Fig 3. This image shows the table in PowerPivot.
</p>


First the data got segmented into customers based on their age, education, gender, occupation and relationship. The incidents were segmented by bodily injuries, property damage, severity, time, type and vehicles involved. The resulting PivotTables were used to created PivotCharts. 

These PivotCharts were already able to answer basic questions and give insights into the data. For example the bar chart regardin the insured hobbies indicates that chess and cross fit enthusiasts in the data have a higher rate of comitting car insurance fraud.


<p align="center">
  <img src="https://i.postimg.cc/33TSgRKr/Screenshot-14.jpg"/>
  Fig 4. This image shows the different pivot tables.
</p>

<p align="center">
  <img src="https://i.postimg.cc/Vs2TyWQX/Screenshot-13.jpg"/>
  Fig 5. This image shows the different pivot charts.
</p>


Furthermore to solve the final question of the correlation I used the regression analysis to calculate the variable Multilple R. This was 0,1565 and as a consquence there was no statistical correlation between the months as customer and the amount of claims.


<p align="center">
  <img src="https://i.postimg.cc/wqVdTzvF/Screenshot-9.jpg"/>
  Fig 6. This image shows the correlation analysis between months as customer and fraudulent claims made.
</p>


## Validation

Lorem Ipsum.

## Visualisation

To make it easy to view all this information at once, I created a dashboard that displays all the charts. I also added a slicer to the dashboard, which allows users to filter the data based on different criteria and his own interests. This makes it easy to answer the initial questions regarding car insurance fraud.


<p align="center">
  <img src="https://i.postimg.cc/NfBsNRxD/Screenshot-18.jpg"/>
  Fig 7. This image shows the Car Insurance Fraud Dashboard.
</p>


## Result

Using the dashboard, I was able to answer the intial issues and gain following insights:

- State: The state with the most comitted frauds is Ohio. There appear to be no irregularities compared to the data of insured person who didn't commit fraud. An actionable insight would be still to keep an eye out for claims made from policies in Ohio.

-	Insured: The largest group of insured persons who comitted fraud falls within the middle age range of 35-44 and are single. Men on the one hand and people with a doctors degree on the other hand appear to have a tendency to be more prone to commit fraud. The big surprise lies in the large amount of chess and cross fit in the data regarding hobbies and explicitly men in a executive managerial position and women with a sales occupation. All four of these properties have a way higher percentage of total amount compared to the data of insured who didn't commit fraud. Resulting in an advice to be more aware with claims from these insured people.

-	Incident: Many incidents ivolving fraud happen at midday and were single vehicle collisions involving major damages. The amount of major damages relatively compared to the data of insured who didn't commit crime is way larger with 69% to 14%. Also the data indicates that a parked car or vehicle theft is a very uncommon occurence as an incident type for car isnurance fraud. These insights should bhelp with recognizibg fraudulent claims more easily.

-	Month As Customer: With help of the regression analysis I was able to prove there being no correlation between month as customer and fraudulent claims. An insight to take with would be to further strengthen longeveity, because the amount of claims is reduced over time.


These findings provide valuable insights into the demographics and preferences of fraudulent insured.
