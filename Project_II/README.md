<h1 align="center">COVID-19 Data Exploration Documentation</h1>

<p align="center">
  <img width="273px" src="https://github.com/blackcrowX/blackcrowX.github.io/blob/main/images/icons/sql_server.png?raw=true"/>
  <img width="273px" src="https://github.com/blackcrowX/blackcrowX.github.io/blob/main/images/icons/tableau.png?raw=true"/>
</p>

This project encompasses a comprehensive analysis of COVID-19 cases utilizing SQL, aiming to uncover valuable insights. The analysis pipeline encompasses essential stages such as data loading, data cleaning, data preprocessing, data analysis, and data visualization. By leveraging advanced SQL skills, including Joins, CTEs, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, and Converting Data Types, this project showcases a sophisticated approach to deriving meaningful conclusions. 

Moreover, to facilitate effective communication of the findings, a visually appealing and interactive Tableau Dashboard has been developed. This dashboard provides an intuitive and user-friendly platform for exploring and interpreting the analyzed data, enhancing the accessibility and usability of the insights gained from the SQL analysis. 

**Code:** [`Covid_Queries.sql`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_II/Covid_Queries.sql)

## Table of Contents
- [Case](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Case)
- [Dataset](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Data)
- [Preparation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Preparation)
- [SQL](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#SQL)
  - [Loading](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Loading)
  - [Cleaning](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Cleaning)
  - [Preprocessing](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Preprocessing)
  - [Visualisation](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Visualisation)
  - [Analysis](https://github.com/blackcrowX/Data-Analysis-Portfolio/blob/main/Project-II/readme.md#Analysis)
- Tableu
  - X

## Case

The COVID-19 pandemic has had a profound impact on societies worldwide, prompting the need for rigorous data analysis to guide decision-making processes. The OWID COVID-19 dataset offers a comprehensive collection of daily updates on cases, deaths, vaccinations, testing, and other relevant variables for countries across the globe. This case study aims to explore this rich dataset and uncover valuable insights that can help shape public health strategies, policies, and interventions. Through this data exploration, we anticipate uncovering several interesting insights, such as:

- Identification of countries with successful containment strategies and their key contributing factors.
- Examination of the relationship between vaccination rates and infection rates, including the impact of different vaccine types.
- Evaluation of the effectiveness of testing strategies in controlling the spread of the virus.
- Analysis of the disparities in COVID-19 outcomes based on socioeconomic factors and healthcare infrastructure.
- Identification of potential indicators that can predict the severity of outbreaks in different regions.

By examining various dimensions of the data, we will gain a comprehensive understanding of the factors influencing the spread and control of COVID-19. The findings from this study can help inform public health policies, interventions, and decision-making processes, ultimately contributing to effective pandemic management strategies globally.

## Dataset

The data contains records of Covid-19 cases, deaths and vaccine records by country in 2020-2023. The CSV file columns are separated into country, date and population followed by various informations regarding the covid cases, deaths and the vaccine. The dataset is published by OWID and is continously kept uptodate. The version of the dataset used was downloaded on the 17.05.2023.

**Data:** [`owid_covid_data.csv`](https://github.com/owid/covid-19-data/blob/master/public/data/owid-covid-data.csv)

**Source:** [`ourworldindata.org`](https://ourworldindata.org/coronavirus)

## Preparation

Before we can start the analysis in PostgreSQL we will seperate the initial dataframe `owid_covid_data.csv` into two seperate dataframes named `covid_deaths.xlsx` and `covid_vaccinations.xlsx` and format the date column to represent the YYYY-MM-DD format.

Then we will use `Converter_Excel_CSV.ipynb` to convert the Excel files into CSV files. Then we will create two tables in PostgreSQL and load the converted files into PostgreSQL.

Now we can start the analysis with SQL.

## SQL

The analysis is divided into several sections, each focusing on a specific aspect of COVID-19 data exploration. Here is a brief summary of each section:

1. **Checking Dataset Responsiveness:** This section retrieves all rows from the `covid_deaths` table where the continent is not null. The purpose is to verify if the dataset is responsive and can be accessed correctly.

```
Select *
From covid_deaths
Where continent is not null 
Order by 3,4;
```

2. **Selecting Data from Germany:** This section selects specific columns from the `covid_deaths` table for the location 'Germany', providing information about total cases, new cases, total deaths, and population. The data is sorted in descending order based on the date column.

```
Select Location, date, total_cases, new_cases, total_deaths, population
From covid_deaths
Where location = 'Germany'
Order by 2 DESC;

```

3. **Total Cases vs Total Deaths in Germany:** This section calculates the death percentage in Germany by dividing the total deaths by the total cases and multiplying by 100. It provides insights into the severity of the disease in terms of deaths relative to the total number of cases.

```
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as death_percentage
From covid_deaths
Where location = 'Germany'
Order by 2 DESC;
```

4. **Total Cases vs Population in Germany:** This section calculates the percentage of the population infected with COVID-19 in Germany by dividing the total cases by the population and multiplying by 100. It helps understand the extent of the disease's spread in relation to the overall population.

```
Select location, date, population, total_cases,  (total_cases/population)*100 as percent_population_infected
From covid_deaths
Where location = 'Germany'
Order by 2 DESC;
```

5. **Countries with Highest Infection Rate compared to Population:** This section identifies countries with the highest infection rate compared to their respective populations. It calculates the percentage of the population infected and highlights the countries with the maximum infection count.

```
Select location, population, MAX(total_cases) as highest_infection_count,  MAX((total_cases/population))*100 as percent_population_infected
From covid_deaths
Where continent is not null
And total_cases is not null
Group by Location, Population
Order by percent_population_infected DESC;
```

6. **Countries with Highest Death Count per Population:** This section determines the countries with the highest death count per population. It calculates the total death count for each country and ranks them accordingly.

```
Select Location, MAX(total_deaths) as total_death_count
From covid_deaths
Where continent is not null
And total_deaths is not null
Group by Location
Order by total_death_count DESC;
```

7. **Showing Continents with the Highest Death Count per Population:** This section focuses on continents and presents the continents with the highest death count per population. It calculates the total death count for each continent and ranks them accordingly.

```
Select continent, MAX(total_deaths) as total_death_count
From covid_deaths
Where continent is not null 
Group by continent
Order by total_death_count DESC;
```

8. **Global Numbers:** This section provides global statistics related to COVID-19. It calculates the total cases, total deaths, and death percentage worldwide by summing the corresponding values across continents.

```
Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as death_percentage
From covid_deaths
Where continent is not null 
Order by 1,2;
```

9. **Total Population vs Vaccinations:** This section explores the relationship between the total population and the number of vaccinations in each country. It combines data from the `covid_deaths` and `covid_vaccinations` tables, calculates rolling counts of vaccinated people, and displays the relevant information.

```
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as rolling_people_vaccinated
From covid_deaths dea
Join covid_vaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;
```

10. **Using Temp Table to Perform Calculation on Partition By in Previous Query:** This section creates a temporary table named `percent_population_vaccinated` to store data related to population, vaccinations, and rolling counts of vaccinated people. It uses the temporary table to calculate the percentage of rolling people vaccinated and displays the results.

```
Create table if not exists percent_population_vaccinated (
	Continent varchar,
	location varchar,
	date date,
	population numeric,
	new_vaccinations numeric,
	rolling_people_vaccinated numeric
);

Insert into percent_population_vaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER(Partition by dea.Location order by dea.location, dea.Date) as rolling_people_vaccinated
From covid_deaths dea
Join covid_vaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date;

Select *, (rolling_people_vaccinated/Population)*100 as percentage_rolling_people_vaccinated
From percent_population_vaccinated;
```

11. **Creating View to Store Data for Later Visualizations:** This section creates a view named `view_percent_population_vaccinated` to store data related to COVID-19 vaccinations and rolling counts of vaccinated people. The view can be used for later visualizations or to simplify complex queries. The skills used in this analysis showcase a variety of SQL techniques that allow for data exploration, aggregation, and calculation of meaningful metrics. These skills are essential for data analysts to derive insights and draw conclusions from large datasets. The analysis presented in this portfolio demonstrates the application of these skills in the context of COVID-19 data exploration.

```
Create view view_percent_population_vaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as rolling_people_vaccinated
--, (RollingPeopleVaccinated/population)*100
From covid_deaths dea
Join covid_vaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null " pleasse write  a dokumentation highlighting the used skills and making it readable.
```

With this we have explored the dataset and can continue with the data visualisation

## Tableau
