-- Covid 19 Analysis

-- Initial Dataset Check
SELECT *
FROM covid_deaths
WHERE continent IS NOT null 
ORDER BY 3, 4;

-- Data from Germany
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
WHERE location = 'Germany'
AND new_cases IS NOT null
ORDER BY 2 DESC;

-- Total Cases vs Total Deaths in Germany
SELECT location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 AS death_percentage
FROM covid_deaths
WHERE location = 'Germany'
AND new_cases IS NOT null
ORDER BY 2 DESC;

-- Total Cases vs Population in Germany
SELECT location, date, population, total_cases, (total_cases/population)*100 AS percent_population_infected
FROM covid_deaths
WHERE location = 'Germany'
AND total_cases IS NOT null
ORDER BY 2 DESC;

-- Global Numbers
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS death_percentage
FROM covid_deaths
WHERE continent IS NOT null 
ORDER BY 1, 2;

-- Countries with Highest Infection Rate compared to Population
SELECT location, population, SUM(new_cases) as highest_infection_count,  (SUM(new_cases)/MAX(population))*100 as percent_population_infected
FROM covid_deaths
WHERE continent IS NOT null
AND new_cases IS NOT null
GROUP BY location, population
ORDER BY percent_population_infected DESC;

-- Countries and Date with Highest Infection Rate compared to Population
SELECT location, date, population, MAX(total_cases) AS highest_infection_count,  MAX((total_cases/population))*100 AS percent_population_infected
FROM covid_deaths
WHERE continent IS NOT null
-- AND new_cases IS NOT null
GROUP BY location, date, population
ORDER BY percent_population_infected DESC;

-- Countries with Highest Death Count per Population
SELECT location, SUM(new_deaths) AS total_death_count
FROM covid_deaths
WHERE continent IS NOT null
AND new_deaths IS NOT null
GROUP BY location
ORDER BY total_death_count DESC;

-- Contintents with Highest Death Count per Population
SELECT continent, SUM(new_deaths) AS total_death_count
FROM  covid_deaths
WHERE continent IS NOT null
GROUP BY continent
ORDER BY total_death_count DESC;

-- Total Population vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM(vac.new_vaccinations) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS rolling_people_vaccinated
FROM covid_deaths dea
JOIN covid_vaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null 
AND new_vaccinations IS NOT null
ORDER BY 2,3;

-- Temp Table for Calculation on Partition By in Previous Query
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

-- View of Countries for Later Visualisations
DROP VIEW IF EXISTS view_country_cases;
CREATE VIEW view_country_cases AS
SELECT dea.continent, dea.location, dea.date, dea.population, dea.new_cases, des.new_deaths, vac.people_vaccinated, vac.people_fully_vaccinated, vac.total_tests
FROM covid_deaths dea
JOIN covid_vaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT null;

-- View of Income for Later Visualisations
DROP VIEW IF EXISTS view_income_cases;
CREATE VIEW view_income_cases AS
SELECT dea.continent, dea.location, dea.date, dea.population, dea.new_cases, des.new_deaths, vac.people_vaccinated, vac.people_fully_vaccinated, vac.total_tests
FROM covid_deaths dea
JOIN covid_vaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS 'high income'
Or dea.continent IS  'higher middle income'
Or dea.continent IS  'lower middle income'
Or dea.continent IS  'low income';
