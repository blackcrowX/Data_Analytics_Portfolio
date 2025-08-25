<h1 align="center">Global Covid Cases</h1> 

<p align="center">
  <img width="200px" src="https://github.com/blackcrowX/blackcrowX.github.io/blob/main/images/icons/postgresql.png?raw=true"/>
  <img width="200px" src="https://github.com/blackcrowX/blackcrowX.github.io/blob/main/images/icons/tableau.png?raw=true"/>
</p>

This project utilises PostgreSQL and Tableau for comprehensive analysis and visualization of global COVID-19 data. The dataset includes cases and vaccinations across countries and continents. Key findings highlight the highest cases in Asia, highest deaths in Europe, and the United States leading in both cases and deaths.

## Table of Contents
- [1.1. Introduction](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Introduction)
- [1.2. Objective](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Objective)
- [1.3. Initial Data](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Dataset)
- [2. Preparation](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Preparation)
- [3.1. Loading in SQL](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Loading)
- [3.2. Exploration in SQL](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Exploration)
- [4.1. Data for Tableau](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Preprocessing)
- [4.2. Visualisation](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Visualisation)
- [5. Analysis](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Analysis)
- [6. Conclusion](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/README.md#Conclusion)

## 1.1. Introduction

This project encompasses an analysis of COVID-19 cases utilizing SQL and Tableau, aiming to uncover valuable insights. The analysis pipeline encompasses essential stages such as data preparation, data loading, data aexploration, data preprocessing, data visualisation and data analysis. By leveraging advanced SQL skills, including Joins, CTEs, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, and Converting Data Types, this project showcases a sophisticated approach to deriving meaningful conclusions. Moreover, to facilitate effective communication of the findings, a visually appealing and interactive Tableau Dashboard has been developed. This dashboard provides an intuitive and user-friendly platform for exploring and interpreting the analyzed data, enhancing the accessibility and usability of the insights gained from the SQL analysis. 

**Project SQL-Code:** [`Covid_Queries.sql`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/Covid_Queries.sql)

**Project Tableau-Code:** [`Covid_Visualisation.twb`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/Covid_Visualisation.twb)

**Project Tableau-Dashboard:** [`Covid_Dashboard`](https://public.tableau.com/app/profile/blackcrowx/viz/CovidVisualisation_16847540534400/MainDashboard)

**Project Author:** [blackcrowX](https://github.com/blackcrowX)

## 1.2. Objective

The COVID-19 pandemic has had a profound impact on societies worldwide, prompting the need for rigorous data analysis to guide decision-making processes. The OWID COVID-19 dataset offers a comprehensive collection of daily updates on cases, deaths, vaccinations, testing, and other relevant variables for countries across the globe. This case study aims to explore this rich dataset and uncover valuable insights that can help shape public health strategies, policies, and interventions. Through this data exploration, we anticipate answering following questions:

- Which continent has the highest amount of total cases and which has the highest death count?
- Which country has the highest amount of total cases relative to population count and which has the highest death count relative to the population count?
- Are there any questionable data inputs in the dataset?
- Can we predict the development of new cases and total cases?

## 1.3. Initial Data

The data contains records of Covid-19 cases, deaths and vaccine records by country in 2020-2023. The CSV file columns are separated into country, date and population followed by various informations regarding the covid cases, deaths and the vaccine. The dataset is published by OWID and is continously kept updated. The version of the dataset used was downloaded on the 17.05.2023.

**Data File:** [`owid_covid_data.csv`](https://github.com/owid/covid-19-data/blob/master/public/data/owid-covid-data.csv)

**Data Source:** [Our World in Data](https://ourworldindata.org/coronavirus)

## 2. Preparation

To conduct the analysis in PostgreSQL, several steps were undertaken to prepare the data for further processing and analysis. These steps involved data splitting, formatting, and conversion.

The initial dataset, `owid_covid_data.csv`, was split into two separate dataframes named `covid_deaths.xlsx` and `covid_vaccinations.xlsx`. This splitting allowed for a more focused analysis on specific aspects of the data. Additionally, the date column in the dataset was formatted to follow the YYYY-MM-DD format, ensuring consistency and ease of analysis.

To facilitate the subsequent analysis in PostgreSQL, the Excel files were converted into CSV files using the `Converter_Excel_CSV.ipynb` notebook. 

```
import pandas as pd
import io
```

```
from google.colab import files
uploaded = files.upload()
```

```
read_file = pd.read_excel (io.BytesIO(uploaded['covid_vaccinations.xlsx']))
```

```
read_file.to_csv (r'covid_vaccinations.csv', index = False, header=True)
```

This conversion process was essential as PostgreSQL is better suited for handling data in CSV format.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_1.png"/>
  <em>Figure 1: The excel file owid_covid_data as CSV before splitting.</em>
</p>

By completing these preparation steps, including data splitting, date formatting, and file conversion to CSV format, we have successfully prepared the data for analysis in PostgreSQL. These initial steps ensure that the data is structured and ready for further exploration and analysis in the database management system.

## 3.1. Loading in SQL

To facilitate the analysis of data in PostgreSQL, the prepared DataFrames, covid_deaths and covid_vaccinations, need to be loaded into separate tables in the database. This process involves creating the tables and importing the data from the corresponding CSV files.

The `covid_deaths` table is created with manually defined columns to match the structure of the DataFrame. The table includes columns such as `date` of type `DATE`, `country` of type `VARCHAR(255)`, `total_deaths` of type `INTEGER`, and other relevant columns.

Similarly, we will create the `covid_vaccinations` table in PostgreSQL, ensuring that the columns match the structure and data types of the `covid_vaccinations_df` DataFrame.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_2.png"/>
  <em>Figure 2: The columns of the table covid_Deaths in PostgreSQL.</em>
</p>

Once the tables are created, we will import the data from the corresponding CSV files (`covid_deaths.csv` and `covid_vaccinations.csv`) into the respective tables in PostgreSQL. This can be done using the import functionality of the PostgreSQL client tool. During the import process, we need to ensure that the columns of the tables in PostgreSQL are correctly mapped to the columns of the CSV files.

After successfully loading the data into the tables, we can proceed with data analysis using SQL queries. By writing appropriate SQL queries, we can extract insights, perform calculations, and conduct various analyses on the COVID-19 deaths and vaccinations data.


## 3.2. Exploration in SQL

The exploartion is divided into several sections, each focusing on a specific aspect of COVID-19 data exploration. 

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_3.png"/>
  <em>Figure 3: The SQL queries in PostgreSQL.</em>
</p>

Here is a brief summary of each relevant section:

1. **Total Cases vs Total Deaths in Germany:** This section calculates the death percentage in Germany by dividing the total deaths by the total cases and multiplying by 100. It provides insights into the severity of the disease in terms of deaths relative to the total number of cases.

```
SELECT Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 AS death_percentage
FROM covid_deaths
WHERE location = 'Germany'
AND new_cases IS NOT null
ORDER BY 2 DESC;
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__1.png"/>
</p>

2. **Total Cases vs Population in Germany:** This section calculates the percentage of the population infected with COVID-19 in Germany by dividing the total cases by the population and multiplying by 100. It helps understand the extent of the disease's spread in relation to the overall population.

```
SELECT location, date, population, total_cases, (total_cases/population)*100 AS percent_population_infected
FROM covid_deaths
WHERE location = 'Germany'
AND total_cases IS NOT null
ORDER BY 2 DESC;
```
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__2.png"/>
</p>
```
3.  **Global Numbers:** This section provides global statistics related to COVID-19. It calculates the total cases, total deaths, and death percentage worldwide by summing the corresponding values across continents.

```
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS death_percentage
FROM covid_deaths
WHERE continent IS NOT null 
ORDER BY 1, 2;
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__3.png"/>
</p>

4. **Countries with Highest Infection Rate compared to Population:** This section identifies countries with the highest infection rate compared to their respective populations. It calculates the percentage of the population infected and highlights the countries with the maximum infection count.

```
SELECT location, population, SUM(new_cases) as highest_infection_count, (SUM(new_cases)/MAX(population))*100 as percent_population_infected
FROM covid_deaths
WHERE continent IS NOT null
AND new_cases IS NOT null
GROUP BY location, population
ORDER BY percent_population_infected DESC;
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__4.png"/>
</p>

5. **Countries with Highest Death Count per Population:** This section determines the countries with the highest death count per population. It calculates the total death count for each country and ranks them accordingly.

```
SELECT location, SUM(new_deaths) AS total_death_count
FROM covid_deaths
WHERE continent IS NOT null
AND new_deaths IS NOT null
GROUP BY location
ORDER BY total_death_count DESC;
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__5.png"/>
</p>

6. **Showing Continents with the Highest Death Count per Population:** This section focuses on continents and presents the continents with the highest death count per population. It calculates the total death count for each continent and ranks them accordingly.

```
SELECT continent, SUM(new_deaths) AS total_death_count
FROM  covid_deaths
WHERE continent IS NOT null
GROUP BY continent
ORDER BY total_death_count DESC;
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__6.png"/>
</p>

7. **Total Population vs Vaccinations:** This section explores the relationship between the total population and the number of vaccinations in each country. It combines data from the `covid_deaths` and `covid_vaccinations` tables, calculates rolling counts of vaccinated people, and displays the relevant information.

```
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM(vac.new_vaccinations) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS rolling_people_vaccinated
FROM covid_deaths dea
JOIN covid_vaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null 
AND new_vaccinations IS NOT null
ORDER BY 2,3;
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__7.png"/>
</p>

8. **Using Temp Table to Perform Calculation on Partition By in Previous Query:** This section creates a temporary table named `percent_population_vaccinated` to store data related to population, vaccinations, and rolling counts of vaccinated people. It uses the temporary table to calculate the percentage of rolling people vaccinated and displays the results.

```
DROP TABLE IF EXISTS percent_population_vaccinated;
CREATE TABLE IF NOT EXISTS percent_population_vaccinated (
	Continent varchar,
	location varchar,
	date date,
	population numeric,
	new_vaccinations numeric,
	rolling_people_vaccinated numeric
);

INSERT INTO percent_population_vaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER(PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS rolling_people_vaccinated
FROM covid_deaths dea
JOIN covid_vaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date;

SELECT *, (rolling_people_vaccinated/population)*100 as percentage_rolling_people_vaccinated
FROM percent_population_vaccinated
WHERE continent IS NOT null
AND new_vaccinations IS NOT null;
```
<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/Screenshot__8.png"/>
</p>

By performing these analyses and executing the SQL queries, we gain valuable insights into various aspects of COVID-19 data. These insights contribute to a deeper understanding of the impact of the disease on different countries, populations, and regions.

## 4.1. Data for Tableau

As part of the preprocessing phase, we will create a view named view_percent_population_vaccinated to store data related to COVID-19 vaccinations and rolling counts of vaccinated people. This view can be used for later visualisations or to simplify complex queries. The SQL code for creating the view is as follows:

```
DROP VIEW IF EXISTS view_country_cases;
CREATE VIEW view_country_cases AS
SELECT dea.continent, dea.location, dea.date, dea.population, dea.new_cases, dea.new_deaths, vac.people_vaccinated, vac.people_fully_vaccinated, vac.total_tests
FROM covid_deaths dea
JOIN covid_vaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null;
```

The view `country_cases` combines data from the `covid_deaths` and `covid_vaccinations` tables for countries, linking them based on location and date. It includes columns such as `continent`, `location`, `date`, `population`, `new_cases`. It excludes data without a continent, because this data is recording income classes and isn't relevant for the further visualisation.

For integer values all occurrences of "." have to be replaced with "," to facilitate the subsequent step of data loading in Tableau. By using commas instead of periods for integer values, Tableau can automatically recognise the appropriate data types for each column during the import process. This is done using excel and the resulting data can be loaded into Tableau for further visualisation and analysis.
	
By completing these steps, we have created a view to store relevant data, insured necessary adjustments for compatibility with Tableau and successfully loaded the data into Tableau for further exploration with tableu.

## 4.2. Visualisation in Tableau

The visualisation process in Tableau involved creating multiple worksheets to present different aspects of the data in an informative and visually appealing manner.

We began by designing a worksheet that provided a summary of the data, highlighting key numbers and important metrics. This table incorporated calculated fields to display percentages, offering a quick overview of the dataset.

Next, we developed a visually striking map that showcased the geographical distribution of COVID-19 cases and vaccinations. This map allowed us to identify regional patterns and variances in the data. To enhance usability, we implemented an action filter that automatically filtered the data based on the selected country, providing users with a more focused view.

To compare various metrics across different continents, we constructed a bar chart worksheet. This chart enabled us to analyze regional trends and disparities, offering insights into the impact of COVID-19 on different parts of the world. Similar to the map, the bar chart also featured an action filter that allowed users to filter the data by selecting a specific continent.

In addition, we developed a chart to depict the trend of new cases and total cases over time. This visualisation provided a comprehensive view of the COVID-19 progression, allowing us to identify significant patterns or spikes. To enhance the usefulness of this chart, we implemented a prediction feature that forecasted the trend of new cases and total cases based on historical data.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_5.png"/>
  <em>Figure 4: The worksheet "Cases" in Tableau.</em>
</p>

Once the individual worksheets were created, we combined them into a cohesive dashboard in Tableau. This dashboard integrated all the visualisations, providing a comprehensive and interactive view of the data. Stakeholders could explore the data from multiple perspectives and gain insights into the COVID-19 situation.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_6.png"/>
  <em>Figure 5: The final dashboard in Tableau.</em>
</p>

To share our findings, we uploaded the final view and dashboard to Tableau Public. The interactive dashboard can be accessed using the following link: 
https://public.tableau.com/app/profile/blackcrowx/viz/CovidVisualisation_16847540534400/MainDashboard

By following this visualisation process, we conducted a thorough analysis of the data and presented key insights through engaging visualisations. The Tableau dashboard empowered stakeholders to explore and interact with the COVID-19 data effectively, gaining a deeper understanding of the trends and patterns within the dataset.

## 5. Analysis

In this data analysis and visualisation project, we utilized PostgreSQL and Tableau to explore global COVID-19 cases. Our objective was to gain insights from the data, and we have successfully achieved the following key findings:

- **Continent Analysis:** Our analysis revealed that Asia has the highest total number of COVID-19 cases, reaching 2.969 million, while Europe has the highest death count, exceeding 20.5 million. This highlights the significant impact of the pandemic on these regions. Furthermore, we found that Oceania has the highest case count compared to its population, accounting for 31.16% of its inhabitants. On the other hand, South America has the highest death count relative to its population, with a rate of 0.31%. These continent-specific insights provide a deeper understanding of the regional dynamics and the challenges faced by different parts of the world.

- **Country Analysis:** Digging deeper into individual countries, we discovered that the United States has the highest total number of cases, surpassing 1.033 million. This highlights the magnitude of the outbreak within the country. Additionally, Cyprus has the highest relative amount of cases, with a staggering 73.76% of its population reported as infected. These findings shed light on the varying levels of impact experienced by different countries. In terms of deaths, the United States also leads with the highest absolute death count, reaching 11 million. Peru, on the other hand, has the highest relative death count at 0.65%. These country-specific insights help us understand the severity of the pandemic within different national contexts.

- **Case Trends:** By analyzing the data over time, we identified interesting trends in case counts. China experienced a significant spike in new cases on December 19, 2022, with over 411 million new cases reported, peaking at 5 million new cases before that. This observation suggests a localized outbreak within China during that period. In contrast, most other countries displayed spikes in new cases during January and February 2022. Furthermore, the new cases curves for other countries exhibited noticeable fluctuations, indicating variations in the spread of the virus over time. These insights provide a temporal perspective on the progression of the pandemic and can inform decision-making related to containment measures and resource allocation.

- **Predictive Visualisation:** One of the key achievements of this project was the successful implementation of predictive visualisations in Tableau. By leveraging historical data, we were able to create visual predictions of the curve for new cases and total cases. This powerful feature enables us to anticipate future trends and potential outbreaks. These predictive visualisations can serve as valuable tools for policymakers, healthcare professionals, and researchers to make informed decisions and devise effective strategies in combating the spread of the virus.

Through the combined power of PostgreSQL and Tableau, we have gained valuable insights into the global COVID-19 situation. These findings contribute to our understanding of the spread and impact of the virus, aiding in informed decision-making and response efforts. The analysis and visualizations presented in this project provide a comprehensive overview of the pandemic, enabling stakeholders to take proactive measures to mitigate its effects. By continuously updating and refining our analysis, we can stay informed and adapt our strategies to navigate through these challenging times.

## 6. Conclusion

Based on the analysis of the COVID-19 data, here are some potential takeaways for future analysis:

1. **Consider additional variables:** In future analyses, it may be valuable to incorporate additional variables such as testing rates, hospitalization rates, and vaccination rates. Including these variables can provide a more comprehensive understanding of the COVID-19 situation and its relationship to various factors.

2. **Consider qualitative data:** In addition to quantitative data, incorporating qualitative data such as government policies, public sentiment, and healthcare capacity can provide a more comprehensive analysis. Qualitative data can help explain certain trends or patterns observed in the quantitative analysis.

By considering these potential takeaways, future analyses of COVID-19 data can be more insightful, robust, and actionable, leading to a better understanding of the virus and its effects on populations worldwide.

