<h1 align="center">Analysis with Excel: Car Insurance Claims Fraud</h1>

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Microsoft_Excel_Logo_%282013-2019%29.svg/192px-Microsoft_Excel_Logo_%282013-2019%29.svg.png"/>
</p>

## About

This project is an analysis in excel to gain insights into fraudulent car insurance claims. It contains the processes of data preparation, data modeling, data validation and data visualisation. It showcases the use of advanced skille in Microsoft Excel such as PowerQuery, PivotTables, PivotCharts and..

**Code:** [`Insurance-Claims.xlsx`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

## Table of Contents
- [About](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#about)
- [Goal](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Data](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Preparation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Modeling](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Validation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Visualisation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Result](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

## Case

Insurance fraud is a huge problem in the industry and it's difficult to identify fraud claims. Our goal is to gain insights into the fraud claims and visualize our findings. This results in following business questions for us:

1.  What is the most common age group of people who committed insurance fraud?
2.	What is the most common gender of customers who committed insurance fraud?
3.	What is the most common education level of customers who committed insurance fraud?
4.	What is the most common occupation of customers who committed insurance fraud?
5.	What is the most common incident type for committed insurance fraud?

By answering these questions, we can help the the insurer develop a better understanding of the fraudulent claims and which claims to double-check in the future.

## Data

The dataset we will use contains records on fraudulent car insurance claims from 2015. The csv file contains information regarding the policy, the insured person, the incident, the resulting claims and if the claim was fraudulent.

**Data:** [`insurance-claims.csv`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

**Source:** [`Databricks Inc.`](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/4954928053318020/1058911316420443/167703932442645/latest.html)

## Preparation

To start the project the data file was openend via PowerQuery and data cleaning was performed in PowerQuery to ensure accurate analysis and a better visualisation later on.

<p align="center">
  <img src="https://i.postimg.cc/t90wXBJ8/Screenshot-3.jpg"/>
  Fig 1. This image shows the dataset loaded in PowerQuery.
</p>

First the columns were reorganized resulting in the "Policy Number" becoming the Index. Then excess column at the end of the data was deleted and two new columns named "Capital Total" and "Age Group" were created to better visualise the data.

After the initial Setup the data was checked for mising values and existing duplicates to avoid potential errors and biases in the dataset. In this case there were no missing values or duplicates. 

Then the data was updated to be more interpretable via the replace and proper function. For Example the value "Husband" and "Wife" for the column "Insured Relationship" were changed to "Married".

<p align="center">
  <img src="https://i.postimg.cc/jRP553Xf/Screenshot-4.jpg"/>
  Fig 2. This image shows the dataset after it was cleaned.
</p>

The resulting data was then exported and can now be used for further modeling to gain more insights into the issue.

## Modeling

We will start by segmenting the customers based on their age, gender, income, marital status, etc.
I used the customer data to create pivot tables that grouped the customers based on different criteria. Using these groups, I created charts that show key insights. Additionally, differnt functions were used to perform calculations.

Fig 2. This image shows the different pivot tables and charts.

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
