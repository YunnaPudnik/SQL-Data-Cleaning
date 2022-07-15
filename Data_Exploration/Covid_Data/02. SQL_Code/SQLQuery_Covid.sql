 -- 1.
 
 SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths as int)) AS total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 AS DeathPercentage
From PortfolioProject..Covid_Death
--Where location like '%states%'
WHERE continent is not null 
--Group By date
ORDER BY 1,2


--2.

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..Covid_Death
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

--3.

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..Covid_Death
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc