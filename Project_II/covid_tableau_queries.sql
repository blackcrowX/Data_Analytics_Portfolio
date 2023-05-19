-- Tableau Queries

-- 1. 
Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as death_percentage
From covid_deaths
Where continent is not null 
Order by 1,2;

-- 2. 
Select location, SUM(new_deaths) as total_death_count
From covid_deaths
Where continent is null 
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by location
Order by total_death_count DESC;

-- 3.
Select Location, population, MAX(total_cases) as highest_infection_count,  MAX((total_cases/population))*100 as percent_population_infected
From covid_deaths
Where total_cases is not null
Group by location, population
Order by percent_population_infected DESC;

-- 4.
Select Location, population, date, MAX(total_cases) as highest_infection_count,  MAX((total_cases/population))*100 as percent_population_infected
From covid_deaths
Where total_cases is not null
Group by location, population, date
Order by percent_population_infected DESC;
