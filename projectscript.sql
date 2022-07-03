
#Queries used for Tableau Project 

#1

select SUM(new_cases) as total_cases,
SUM(cast(new_deaths as signed)) as total_deaths,
SUM(cast(new_deaths as signed))/SUM(new_cases)*100 as DeathPercentage
from coviddeathscsv
where continent is not null
order by 1,2;

#Double checking based off of the data provided

#2

#We take these out as they are not included in the above query

Select continent, SUM(cast(new_deaths as signed)) as TotalDeathCount
From coviddeathscsv
Where continent is not null 
and location not in ('World', 'European Union', 'International')
Group by continent
order by TotalDeathCount desc;


#3

select location, population, MAX(total_cases) as HighestInfectionCount,  
(max(total_cases)/population)*100 as PercentPopulationInfected
from coviddeathscsv
group by location, population
order by PercentPopulationInfected desc;

#4

select location, population, date, MAX(total_cases) as HighestInfectionCount,  
(max(total_cases)/population)*100 as PercentPopulationInfected
from coviddeathscsv
group by location, population, date
order by PercentPopulationInfected desc;






























