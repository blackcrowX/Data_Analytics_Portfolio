<h1 align="center">Analysis with Excel: Car Insurance Claims Fraud</h1>

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Microsoft_Excel_Logo_%282013-2019%29.svg/192px-Microsoft_Excel_Logo_%282013-2019%29.svg.png"/>
</p>

## About

This project is an analysis in excel to gain insights into fraudulent car insurance claims. It contains the processes of data preparation, data modeling, data validation and data visualisation. It showcases the use of advanced skille in Microsoft Excel such as PowerQuery, PivotTables, PivotCharts and..

**Code:** [`Insurance-Claims.xlsx`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

## Table of Contents
- [About](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#about)
- [Case](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#case)
- [Data](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#data)
- [Preparation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#preparation)
- [Modeling](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#modeling)
- [Validation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#validation)
- [Visualisation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#visualisation)
- [Result](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#result)

## Case

Insurance fraud is a huge problem in the industry and it's difficult to identify fraud claims. Our goal was to help an insurer gain insights into the fraudulent claims and visualize our findings. This resulted in following questions for us:

1. Which state has the highest amount of comitted frauds?
2. What are the common qualities of an insured persons who committed fraud?
3. What is the most common choice of incident from the comitted fraud?
4. Is there a correlation between the monthas as customer and if a fraud was comitted?
5. Is there a correlation between the monthas as customer and if a fraud was comitted?

By answering these questions, we can help the insurer gain insights into the fraudulent cases and which claims to double-check in the future.

## Data

The data contains records on fraudulent car insurance claims from the 1st of January till the 1st of March 2015. The csv file columns are seperated into various informations regarding the policy, the insured person, the incident, the resulting claims made and if the claim was fraudulent.

**Data:** [`insurance-claims.csv`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

**Source:** [`Databricks Inc.`](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/4954928053318020/1058911316420443/167703932442645/latest.html)

## Preparation

The CSV data file was openend and data cleaning was performed via PowerQuery. This was to ensure accurate analysis and better visualisation later on.

<p align="center">
  <img src="https://i.postimg.cc/t90wXBJ8/Screenshot-3.jpg"/>
  Fig 1. This image shows the data loaded in PowerQuery.
</p>

First the columns were reorganised resulting in the "Policy Number" becoming the Index. Then the excess column at the end of the data was deleted and two new columns named "Capital Total" and "Age Group" were created. Then the data was updated to be more interpretable via the replace-function and proper-function. For Example the value "Husband" and "Wife" for the column "Insured Relationship" were changed to "Married". These steps were to better visualise the data.

Afterwards the data was checked for mising values and existing duplicates. In this case there were no missing values or duplicates. This was to avoid potential errors and biases in the data.

<p align="center">
  <img src="https://i.postimg.cc/QXx9x44g/Screenshot-7.jpg"/>
  Fig 2. This image shows the data afterwards in Excel.
</p>

The resulting data was then exported and was ready to be used as a table for modeling.

## Modeling

To start the modeling process we opened the table with PowerPivot to segment it.

<p align="center">
  <img src="https://i.postimg.cc/jK2FyL1x/Screenshot-5.jpg"/>
  Fig 3. This image shows the table in PowerPivot.
</p>

We will start by segmenting the customers based on their age, gender, income, marital status, etc.
I used the customer data to create pivot tables that grouped the customers based on different criteria. Using these groups, I created charts that show key insights. Additionally, differnt functions were used to perform calculations.

<p align="center">
  <img src=""/>
  Fig 4. This image shows the different pivot tables and charts.
</p>

<p align="center">
  <img src="https://i.postimg.cc/wqVdTzvF/Screenshot-9.jpg"/>
  Fig 4. This image shows the correlation analysis between months as customer and fraudulent claims made.
</p>

## Validation

Lorem Ipsum.

## Visualisation

To make it easy to view all this information at once, I created a dashboard that displays all the charts. I also added a slicer to the dashboard, which allows users to filter the data based on different criteria. This makes it easy to identify the customer segments that are most likely to purchase a bike.

Fig 3. This image shows the Bike Sales Dashboard.

## Result

Using the dashboard, we were able to determine the following insights:

-	Age group: The largest group of bike purchasers falls within the middle age range of 31-50.
-	Education level: Many customers who purchase bikes have completed partial high school education.
-	Occupation: The most prevalent occupation among bike purchasers is in management.
-	Region: North America is the region where most bike purchases are made.
-	Commute distance: Most bike purchasers have a commute distance of 0-1 mile.

In conclusion, these findings provide valuable insights into the demographics and preferences of bike purchasers. By implementing these actionable steps, the business can improve sales and better cater to the needs and interests of its target market.
