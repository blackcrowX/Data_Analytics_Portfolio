<h1 align="center">COVID-19 Cases</h1>

<p align="center">
  <img width="273px" src="https://github.com/blackcrowX/blackcrowX.github.io/blob/main/images/icons/sql_server.png?raw=true"/>
  <img width="273px" src="https://github.com/blackcrowX/blackcrowX.github.io/blob/main/images/icons/tableau.png?raw=true"/>
</p>

## Introduction

This project encompasses a comprehensive analysis of COVID-19 cases utilizing SQL and Tableau, aiming to uncover valuable insights. The analysis pipeline encompasses essential stages such as data preparation, data loading, data analysis, data preprocessing and data visualisation. By leveraging advanced SQL skills, including Joins, CTEs, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, and Converting Data Types, this project showcases a sophisticated approach to deriving meaningful conclusions. Moreover, to facilitate effective communication of the findings, a visually appealing and interactive Tableau Dashboard has been developed. This dashboard provides an intuitive and user-friendly platform for exploring and interpreting the analyzed data, enhancing the accessibility and usability of the insights gained from the SQL analysis. 

**Code:** [`Covid_Queries.sql`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/Covid_Queries.sql)

**Visualisation:** [`Covid_Visualisation.twb`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/Covid_Visualisation.twb)

## Table of Contents
- [Objective](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Objective)
- [Dataset](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Data)
- [Preparation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Preparation)
- [Loading](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Loading)
- [Analysis](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Analysis)
- [Preprocessing](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Preprocessing)
- [Visualisation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Analysis)
- [Conclusion](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Conclusion)

## Objective

The COVID-19 pandemic has had a profound impact on societies worldwide, prompting the need for rigorous data analysis to guide decision-making processes. The OWID COVID-19 dataset offers a comprehensive collection of daily updates on cases, deaths, vaccinations, testing, and other relevant variables for countries across the globe. This case study aims to explore this rich dataset and uncover valuable insights that can help shape public health strategies, policies, and interventions. Through this data exploration, we anticipate uncovering several interesting insights, such as:

- Identification of countries with successful containment strategies and their key contributing factors.
- Examination of the relationship between vaccination rates and infection rates, including the impact of different vaccine types.
- Evaluation of the effectiveness of testing strategies in controlling the spread of the virus.
- Analysis of the disparities in COVID-19 outcomes based on socioeconomic factors and healthcare infrastructure.
- Identification of potential indicators that can predict the severity of outbreaks in different regions.

By examining various dimensions of the data, we will gain a comprehensive understanding of the factors influencing the spread and control of COVID-19. The findings from this study can help inform public health policies, interventions, and decision-making processes, ultimately contributing to effective pandemic management strategies globally.

## Dataset

The data contains records of Covid-19 cases, deaths and vaccine records by country in 2020-2023. The CSV file columns are separated into country, date and population followed by various informations regarding the covid cases, deaths and the vaccine. The dataset is published by OWID and is continously kept updated. The version of the dataset used was downloaded on the 17.05.2023.

**Data:** [`owid_covid_data.csv`](https://github.com/owid/covid-19-data/blob/master/public/data/owid-covid-data.csv)

**Source:** [`ourworldindata.org`](https://ourworldindata.org/coronavirus)

## Preparation

To begin the analysis in PostgreSQL, the first step is to prepare the data by splitting the initial dataframe `owid_covid_data.csv` into two separate dataframes named `covid_deaths.xlsx` and `covid_vaccinations.xlsx`. Additionally, we need to format the date column to represent the YYYY-MM-DD format. 

Once the data has been split and formatted correctly, the next step is to convert the Excel files into CSV files using the `Converter_Excel_CSV.ipynb` notebook. This conversion is necessary to facilitate the subsequent analysis in PostgreSQL.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_1.png"/>
  <em>Figure 1: The excel file covid_Deaths as CSV.</em>
</p>

By completing these preparation and conversion steps, we have now split the initial data, formatted the date column, and converted the relevant files into CSV format. We are now ready to proceed with the analysis in PostgreSQL using the prepared data.


## Loading

To analyze the data in PostgreSQL, we need to load the prepared DataFrames into separate tables. We will create two tables: `covid_deaths` and `covid_vaccinations` in PostgreSQL.

For the `covid_deaths` table, the columns will be manually defined. It will include columns such as `date` of type `DATE`, `country` of type `VARCHAR(255)`, `total_deaths` of type `INTEGER` anc numerous other columns. Similarly, we will create the `covid_vaccinations` table in PostgreSQL, ensuring that the columns match the structure and data types of the `covid_vaccinations_df` DataFrame.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_2.png"/>
  <em>Figure 2: The columns of the table covid_Deaths in PostgreSQL.</em>
</p>

Once the tables are created, we will import the data from the corresponding CSV files (`covid_deaths.csv` and `covid_vaccinations.csv`) into the respective tables in PostgreSQL. This can be done using the import functionality of the PostgreSQL client tool. During the import process, we need to ensure that the columns of the tables in PostgreSQL are correctly mapped to the columns of the CSV files.

After successfully loading the data into the tables, we can proceed with data analysis using SQL queries. By writing appropriate SQL queries, we can extract insights, perform calculations, and conduct various analyses on the COVID-19 deaths and vaccinations data.


## Analysis

The analysis is divided into several sections, each focusing on a specific aspect of COVID-19 data exploration. 

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_3.png"/>
  <em>Figure 3: The SQL queries in PostgreSQL.</em>
</p>

Here is a brief summary of each section:

1. **Checking Responsiveness:** This section retrieves all rows from the `covid_deaths` table where the continent is not null. The purpose is to verify if the dataset is responsive and can be accessed correctly.

```
SELECT *
FROM covid_deaths
WHERE continent IS NOT null 
ORDER BY 3, 4;
```

2. **Selecting Data from Germany:** This section selects specific columns from the `covid_deaths` table for the location 'Germany', providing information about total cases, new cases, total deaths, and population. The data is sorted in descending order based on the date column.

```
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
WHERE location = 'Germany'
AND new_cases IS NOT null
ORDER BY 2 DESC;
```

3. **Total Cases vs Total Deaths in Germany:** This section calculates the death percentage in Germany by dividing the total deaths by the total cases and multiplying by 100. It provides insights into the severity of the disease in terms of deaths relative to the total number of cases.

```
SELECT Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 AS death_percentage
FROM covid_deaths
WHERE location = 'Germany'
AND new_cases IS NOT null
ORDER BY 2 DESC;
```

4. **Total Cases vs Population in Germany:** This section calculates the percentage of the population infected with COVID-19 in Germany by dividing the total cases by the population and multiplying by 100. It helps understand the extent of the disease's spread in relation to the overall population.

```
SELECT location, date, population, total_cases, (total_cases/population)*100 AS percent_population_infected
FROM covid_deaths
WHERE location = 'Germany'
AND total_cases IS NOT null
ORDER BY 2 DESC;
```

5.  **Global Numbers:** This section provides global statistics related to COVID-19. It calculates the total cases, total deaths, and death percentage worldwide by summing the corresponding values across continents.

```
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS death_percentage
FROM covid_deaths
WHERE continent IS NOT null 
ORDER BY 1, 2;
```

6. **Countries with Highest Infection Rate compared to Population:** This section identifies countries with the highest infection rate compared to their respective populations. It calculates the percentage of the population infected and highlights the countries with the maximum infection count.

```
SELECT location, population, SUM(new_cases) as highest_infection_count,  (SUM(new_cases)/MAX(population))*100 as percent_population_infected
FROM covid_deaths
WHERE continent IS NOT null
AND new_cases IS NOT null
GROUP BY location, population
ORDER BY percent_population_infected DESC;
```

7. **Countries and Date with Highest Infection Rate compared to Population:** This section identifies countries with the highest infection rate compared to their respective populations. It calculates the percentage of the population infected and highlights the countries with the maximum infection count.

```
SELECT location, date, population, MAX(total_cases) AS highest_infection_count,  MAX((total_cases/population))*100 AS percent_population_infected
FROM covid_deaths
WHERE continent IS NOT null
AND new_cases IS NOT null
GROUP BY location, date, population
ORDER BY percent_population_infected DESC;
```

8. **Countries with Highest Death Count per Population:** This section determines the countries with the highest death count per population. It calculates the total death count for each country and ranks them accordingly.

```
SELECT location, SUM(new_deaths) AS total_death_count
FROM covid_deaths
WHERE continent IS NOT null
AND new_deaths IS NOT null
GROUP BY location
ORDER BY total_death_count DESC;
```

9. **Showing Continents with the Highest Death Count per Population:** This section focuses on continents and presents the continents with the highest death count per population. It calculates the total death count for each continent and ranks them accordingly.

```
SELECT continent, SUM(new_deaths) AS total_death_count
FROM  covid_deaths
WHERE continent IS NOT null
GROUP BY continent
ORDER BY total_death_count DESC;
```

10. **Total Population vs Vaccinations:** This section explores the relationship between the total population and the number of vaccinations in each country. It combines data from the `covid_deaths` and `covid_vaccinations` tables, calculates rolling counts of vaccinated people, and displays the relevant information.

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

11. **Using Temp Table to Perform Calculation on Partition By in Previous Query:** This section creates a temporary table named `percent_population_vaccinated` to store data related to population, vaccinations, and rolling counts of vaccinated people. It uses the temporary table to calculate the percentage of rolling people vaccinated and displays the results.

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

## Preprocessing

1. **Creating View to Store Data for Later Visualizations:** This section creates a view named `view_percent_population_vaccinated` to store data related to COVID-19 vaccinations and rolling counts of vaccinated people. The view can be used for later visualizations or to simplify complex queries. The skills used in this analysis showcase a variety of SQL techniques that allow for data exploration, aggregation, and calculation of meaningful metrics. These skills are essential for data analysts to derive insights and draw conclusions from large datasets. The analysis presented in this portfolio demonstrates the application of these skills in the context of COVID-19 data exploration.

```
DROP VIEW IF EXISTS view_percent_population_vaccinated;
CREATE VIEW view_percent_population_vaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER(PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS rolling_people_vaccinated
FROM covid_deaths dea
JOIN covid_vaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null;
```

With this we have explored the dataset and can continue with the data visualisation. 
In the exported data we will replace all "." for all integer values with ",". This will make the following step of data loading in Tableau easier, because Tableau can automatically recognize the datatypes of each individual column.

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_4.png"/>
  <em>Figure 4: The data loaded into Tableau.
</p>
	
xx

## Visualisation

For the visualisation we start with

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_5.png"/>
  <em>Figure 5: The worksheet "Cases" in Tableau.
</p>

xx

<p align="center">
  <img src="https://raw.githubusercontent.com/blackcrowX/blackcrowX.github.io/main/images/project_II/screenshot_6.png"/>
  <em>Figure 6: The final dashboard in Tableau.
</p>

xx

## Conclusion
