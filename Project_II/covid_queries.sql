-- Covid 19 Data Exploration 
-- Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

-- Check if Dataset responds

Select *
From covid_deaths
Where continent is not null 
Order by 3,4;

-- Select Data from Germany

Select Location, date, total_cases, new_cases, total_deaths, population
From covid_deaths
Where location = 'Germany'
Order by 2 DESC;

-- Total Cases vs Total Deaths in Germany

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as death_percentage
From covid_deaths
Where location = 'Germany'
Order by 2 DESC;

-- Total Cases vs Population in Germany

Select location, date, population, total_cases,  (total_cases/population)*100 as percent_population_infected
From covid_deaths
Where location = 'Germany'
Order by 2 DESC;

-- Countries with Highest Infection Rate compared to Population

Select location, population, MAX(total_cases) as highest_infection_count,  MAX((total_cases/population))*100 as percent_population_infected
From covid_deaths
Where continent is not null
And total_cases is not null
Group by Location, Population
Order by percent_population_infected DESC;

-- Countries with Highest Death Count per Population

Select Location, MAX(total_deaths) as total_death_count
From covid_deaths
Where continent is not null
And total_deaths is not null
Group by Location
Order by total_death_count DESC;

-- Showing Contintents with the Highest Death Count per Population

Select continent, MAX(total_deaths) as total_death_count
From covid_deaths
Where continent is not null 
Group by continent
Order by total_death_count DESC;

-- Global Numbers

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as death_percentage
From covid_deaths
Where continent is not null 
Order by 1,2;

-- Total Population vs Vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as rolling_people_vaccinated
From covid_deaths dea
Join covid_vaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;

-- Using Temp Table to perform Calculation on Partition By in previous Query

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

-- Creating View to store data for later visualizations

Create view view_percent_population_vaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as rolling_people_vaccinated
--, (RollingPeopleVaccinated/population)*100
From covid_deaths dea
Join covid_vaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 