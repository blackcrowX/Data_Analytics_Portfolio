<h1 align="center">Analysis with Excel: Car Insurance Claims Fraud</h1>

<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Microsoft_Excel_Logo_%282013-2019%29.svg/192px-Microsoft_Excel_Logo_%282013-2019%29.svg.png"/>
</p>

## Table of Contents
- [About](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project%20I/readme.md#about)
- [Goal](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Data](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Preparation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Modeling](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Validation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Visualisation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)
- [Result](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

## About

This project is an analysis in excel including the following steps: data loading, data cleaning and preprocessing and exploratory data analysis.

**Code:** [`Insurance-Claims.xlsx`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

## Case

Insurance fraud is a huge problem in the industry and it's difficult to identify fraud claims. 


Our goal is to identify which . To accomplish this, we will analyse customer data from an Excel sheet containing information on Marital Status, Gender, Income, Children, Education, Occupation, Homeowner, Cars, Commute Distance, Region, Age, and Purchased Bike. Business Questions:

1. What is the most common age group of customers who purchase bikes from the shop?
2.	What is the most common gender of customers who purchase bikes from the shop?
3.	What is the most common income range of customers who purchase bikes from the shop?
4.	What is the most common education level of customers who purchase bikes from the shop?
5.	What is the most common occupation of customers who purchase bikes from the shop?

By answering these questions, the bike shop can develop a better understanding of their ideal customer and tailor their marketing strategies to attract more of these customers.

## Data

The dataset contains records on fraudulent car insurance claims from 2015.

**Data:** [`insurance-claims.csv`](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/)

**Source:** [`Databricks Inc.`](https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/4954928053318020/1058911316420443/167703932442645/latest.html)

## Preparation

Loading Data with PowerQuery
- Reorganize Columns
- Delete Excess Column
- Creat New Column "capital-total"

<p align="center">
<img src="https://i.postimg.cc/t90wXBJ8/Screenshot-3.jpg"/>
</p>

To start the project, data cleaning was performed to ensure accurate analysis. This included the removal of duplicate entries to avoid potential biases in the dataset. Furthermore, the data was updated to be more interpretable, such as replacing "m" and "f" with "male" and "female", and "m" and "s" with "married" and "single". Age groups were also created to facilitate better visualization of the data. Additionally, I ensured there was no missing data and that each field had the correct data type.

Fig 1. This image shows the dataset after it was cleaned.

These steps were essential to ensure that the data was properly formatted for analysis and would yield accurate results. We initially started with 1026 records and now we have 1000.

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
