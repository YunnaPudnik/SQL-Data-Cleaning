-- Salary Survey Data Cleaning

SELECT *
FROM Salary_Survey

SELECT USA_city, USA_state
FROM Salary_Survey
order by USA_state


-- First, let's rename columns, I do it manually
-- Combine other_currency and currency columns

SELECT annual_salary, currency, other_currency
FROM Salary_Survey
ORDER BY annual_salary ASC

update Salary_Survey
set currency = other_currency
where currency = 'other'

ALTER TABLE Salary_Survey
DROP COLUMN other_currency

-- Mismatch numbers in annual salary

SELECT annual_salary
FROM Salary_Survey
ORDER BY annual_salary ASC

-- We can see very small number and it can not be salary per year
-- Let's check currancy for this rows

SELECT annual_salary, currency
FROM Salary_Survey
ORDER BY annual_salary ASC

-- Most of the positions are USD, perhabs peopel forgot to ad zeros.
-- Let's glance at the job and work_field column as well

SELECT annual_salary, currency, job, work_field
FROM Salary_Survey
ORDER BY annual_salary ASC

-- We can see, that few people are unemployed. And others inserted 0 for some other reason
-- As these 15 rows don't provide any salary data, I remove them

DELETE FROM Salary_Survey 
WHERE annual_salary <= 1

-- Other 2-digit and 3-digit number don't look like annual salary either
-- As the minimum annual US salary start from US$15,375, �19,524 in Europe, �18,416 in Britain, 
-- R45,809 in South Africa, CA$28,512 in Canada, TRY43,000 in Turkey, BRL14,544 in Brazil, I remove all rows above that.

DELETE FROM Salary_Survey 
WHERE currency = 'USD' AND annual_salary < 15000

DELETE FROM Salary_Survey 
WHERE currency = 'EUR' AND annual_salary < 19000

DELETE FROM Salary_Survey 
WHERE currency = 'GBP' AND annual_salary < 18000

DELETE FROM Salary_Survey 
WHERE currency = 'ZAR' AND annual_salary < 45000

DELETE FROM Salary_Survey 
WHERE currency = 'CAD' AND annual_salary < 28000

DELETE FROM Salary_Survey 
WHERE currency = 'TRY' AND annual_salary < 43000

DELETE FROM Salary_Survey 
WHERE currency = 'BRL' AND annual_salary < 14500

DELETE FROM Salary_Survey 
WHERE currency = 'Php' AND annual_salary < 140000 

DELETE FROM Salary_Survey 
WHERE currency = 'AUD/NZD' AND annual_salary < 42000

SELECT currency, annual_salary
FROM Salary_Survey
ORDER BY annual_salary ASC

-- Transform into same format in work_country

SELECT DISTINCT(work_country), COUNT(work_country) AS number
FROM Salary_Survey
GROUP BY work_country 
ORDER BY number DESC


UPDATE Salary_Survey
SET work_country = CASE When work_country = 'United States' THEN 'USA'
     When work_country = 'US' THEN 'USA'
	 WHEN work_country = 'U.S.' THEN 'USA'
	 WHEN work_country = 'United States of America' THEN 'USA'
	 WHEN work_country = 'U.S.A.' THEN 'USA'
	 WHEN work_country = 'U.S' THEN 'USA'
	 WHEN work_country = 'America' THEN 'USA'
	 WHEN work_country = 'United State' THEN 'USA'
	 WHEN work_country = 'Unites States' THEN 'USA'
	 WHEN work_country = 'United Stated' THEN 'USA'
	 WHEN work_country = 'U.S.A' THEN 'USA'
	 WHEN work_country = 'The United States' THEN 'USA'
	 WHEN work_country = 'U. S.' THEN 'USA'
	 WHEN work_country = 'United Sates' THEN 'USA'
	 WHEN work_country = 'UnitedStates' THEN 'USA'
	 WHEN work_country = 'United Statea' THEN 'USA'
	 WHEN work_country = 'United Stares ' THEN 'USA'
	 WHEN work_country = 'I.S.' THEN 'USA'
	 WHEN work_country = 'United Status' THEN 'USA'
	 WHEN work_country = 'United Sates of America' THEN 'USA'
	 WHEN work_country = 'USA tomorrow' THEN 'USA'
	 WHEN work_country = 'United States of American' THEN 'USA'
	 WHEN work_country = 'The US' THEN 'USA'
	 WHEN work_country = 'United Statss' THEN 'USA'
	 WHEN work_country = 'United y' THEN 'USA'
	 WHEN work_country = 'USaa' THEN 'USA'
	 WHEN work_country = 'Unted States' THEN 'USA'
	 WHEN work_country = ' United  States' THEN 'USA'
	 WHEN work_country = ' US' THEN 'USA'
	 WHEN work_country = 'United Sttes' THEN 'USA'
	 WHEN work_country = 'United Stateds' THEN 'USA'
	 WHEN work_country = 'U.S>' THEN 'USA'
	 WHEN work_country = 'United States is America' THEN 'USA'
	 WHEN work_country = 'USA-- Virgin Islands' THEN 'USA'
	 WHEN work_country = 'USAB' THEN 'USA'
	 WHEN work_country = 'US of A' THEN 'USA'
	 WHEN work_country = 'Unitef Stated' THEN 'USA'
	 WHEN work_country = 'Usat' THEN 'USA'
	 WHEN work_country = 'For the United States government, but posted overseas' THEN 'USA'
	 WHEN work_country = 'United Statees' THEN 'USA'
	 WHEN work_country = 'U. S ' THEN 'USA'
	 WHEN work_country = 'US govt employee overseas, country withheld' THEN 'USA'
	 WHEN work_country = 'U.SA' THEN 'USA'
	 WHEN work_country = 'Uniyes States' THEN 'USA'
	 WHEN work_country = ' United States' THEN 'USA'
	 WHEN work_country = 'USA (company is based in a US territory, I work remote)' THEN 'USA'
	 WHEN work_country = 'UFrom Romania, but for an US based company' THEN 'USA'
	 WHEN work_country = 'United States- Puerto Rico' THEN 'USA'
	 WHEN work_country = 'United States (I work from home and my clients are all over the US/Canada/PR' THEN 'USA'
	 WHEN work_country = 'United Statws' THEN 'USA'
	 WHEN work_country = 'Worldwide (based in US but short term trips aroudn the world)' THEN 'USA'
	 WHEN work_country = 'United Statesp' THEN 'USA'
	 WHEN work_country = 'USS' THEN 'USA'
	 WHEN work_country = 'Uniyed states' THEN 'USA'
	 WHEN work_country = 'United Stattes' THEN 'USA'
	 WHEN work_country = 'Untied States' THEN 'USA'
	 WHEN work_country = 'Uniteed States' THEN 'USA'
	 WHEN work_country = 'Unitied States' THEN 'USA'
	 WHEN work_country = 'Uniited States' THEN 'USA'
	 WHEN work_country = 'United States of Americas' THEN 'USA'
	 WHEN work_country = 'United statew' THEN 'USA'
	 WHEN work_country = 'United  States' THEN 'USA'
	 WHEN work_country = 'Japan, US Gov position' THEN 'USA'
	 WHEN work_country = ' U.S.' THEN 'USA'
	 WHEN work_country = 'I am located in Canada but I work for a company in the US' THEN 'USA'
	 WHEN work_country = 'Unite States' THEN 'USA'
	 WHEN work_country = 'ISA' THEN 'USA'
	 WHEN work_country = 'United State of America' THEN 'USA'
	 WHEN work_country = 'Japan, US Gov position' THEN 'USA'
	 WHEN work_country = 'USD' THEN 'USA'
	 WHEN work_country = 'UK for U.S. company' THEN 'USA'
	 WHEN work_country = 'IS' THEN 'USA'
	 WHEN work_country = 'United Statues' THEN 'USA'
	 WHEN work_country = 'Uniter Statez' THEN 'USA'
	 WHEN work_country = 'United Statues' THEN 'USA'
	 WHEN work_country = 'United Statues' THEN 'USA'
	 WHEN work_country = 'From Romania, but for an US based company' THEN 'USA'
	 WHEN work_country = 'California ' THEN 'USA'
	 WHEN work_country = 'Virginia ' THEN 'USA'
	 WHEN work_country = 'Hartford ' THEN 'USA'
	 WHEN work_country = 'San Francisco ' THEN 'USA'
	 ELSE work_country
	 END


SELECT DISTINCT(work_country), COUNT(work_country) AS number
FROM Salary_Survey
GROUP BY work_country 
ORDER BY number ASC

UPDATE Salary_Survey
SET work_country = CASE WHEN work_country = 'Australi' THEN 'Australia'
     WHEN work_country = 'Australian' THEN 'Australia'
	 WHEN work_country = 'ARGENTINA BUT MY ORG IS IN THAILAND' THEN 'Argentina'
	 WHEN work_country = 'Can' THEN 'Canada'
	 WHEN work_country = 'Brasil' THEN 'Brazil'
	 WHEN work_country = 'Canad' THEN 'Canada'
	 WHEN work_country = 'Canada, Ottawa, ontario' THEN 'Canada'
	 WHEN work_country = 'Canadá' THEN 'Canada'
	 WHEN work_country = 'Canadw' THEN 'Canada'
	 WHEN work_country = 'Canda' THEN 'Canada'
	 WHEN work_country = 'Csnada' THEN 'Canada'
	 WHEN work_country = 'Czechia' THEN 'Czech Republic'
	 WHEN work_country = 'Czech Republic ' THEN 'Czech Republic'
	 WHEN work_country = 'Danmark' THEN 'Denmark'
	 WHEN work_country = 'hong konh' THEN 'Hong Kong'
	 WHEN work_country = 'Luxemburg' THEN 'Luxembourg'
	 WHEN work_country = 'Mexico ' THEN 'Mexico'
	 WHEN work_country = 'Remote (philippines)' THEN 'Philippines'
	 WHEN work_country = 'singapore' THEN 'Singapore'
	 WHEN work_country = 'México' THEN 'Mexico'
	 WHEN work_country = 'México' THEN 'Mexico'
	 WHEN work_country = ' New Zealand' THEN 'New Zealand'
	 WHEN work_country = 'New Zealand Aotearoa' THEN 'New Zealand'
	 WHEN work_country = 'netherlands' THEN 'Netherlands'
	 WHEN work_country = 'Nederland' THEN 'Netherlands'
	 WHEN work_country = 'NZ' THEN 'New Zealand'
	 WHEN work_country = 'NL' THEN 'Netherlands'
	 WHEN work_country = 'Aotearoa New Zealand' THEN 'New Zealand'
	 WHEN work_country = 'Company in Germany. I work from Pakistan.' THEN 'Germany'
	 WHEN work_country = 'NIGERIA' THEN 'Nigeria'
	 WHEN work_country = 'Panamá' THEN 'Panama'
	 WHEN work_country = 'The Netherlands' THEN 'Netherlands'
	 WHEN work_country = 'U.A.' THEN 'UAE'
	 WHEN work_country = 'UA' THEN 'UAE'
	 WHEN work_country = 'United Arab Emirates ' THEN 'UAE'
	 WHEN work_country = 'Mainland China' THEN 'China'
	 ELSE work_country
	 END
	
SELECT DISTINCT(work_country), COUNT(work_country) AS number
FROM Salary_Survey
GROUP BY work_country 
ORDER BY work_country DESC

UPDATE Salary_Survey
SET work_country = CASE WHEN work_country = 'Wales, UK' THEN 'UK'
     WHEN work_country = 'Wales (United Kingdom)' THEN 'UK'
	 WHEN work_country = 'Wales (UK)' THEN 'UK'
	 WHEN work_country = 'Wales' THEN 'UK'
	 WHEN work_country = 'Unites kingdom ' THEN 'UK'
	 WHEN work_country = 'United Kingdomk' THEN 'UK'
	 WHEN work_country = 'United Kingdom.' THEN 'UK'
	 WHEN work_country = 'United Kingdom (England)' THEN 'UK'
	 WHEN work_country = 'United Kingdom' THEN 'UK'
	 WHEN work_country = 'United Kindom' THEN 'UK'
	 WHEN work_country = 'UK, remote' THEN 'UK'
	 WHEN work_country = 'UK, but for globally fully remote company' THEN 'UK'
	 WHEN work_country = 'UK (England)' THEN 'UK'
	 WHEN work_country = 'U.K. (northern England)' THEN 'UK'
	 WHEN work_country = 'U.K. ' THEN 'UK'
	 WHEN work_country = 'U.K' THEN 'UK'
	 WHEN work_country = 'Scotland, UK' THEN 'UK'
	 WHEN work_country = 'Scotland ' THEN 'UK'
	 WHEN work_country = 'Great Britain ' THEN 'UK'
	 WHEN work_country = 'Englang' THEN 'UK'
	 WHEN work_country = 'England/UK' THEN 'UK'
	 WHEN work_country = 'England, United Kingdom' THEN 'UK'
	 WHEN work_country = 'England, UK' THEN 'UK'
	 WHEN work_country = 'England, Gb' THEN 'UK'
	 WHEN work_country = 'England' THEN 'UK'
	 WHEN work_country = 'Austria, but I work remotely for a Dutch/British company' THEN 'UK'
	 WHEN work_country = 'Northern Ireland, United Kingdom' THEN 'UK'
	 WHEN work_country = 'Northern Ireland' THEN 'UK'
	 WHEN work_country = 'Isle of Man' THEN 'UK'
	 WHEN work_country = 'Britain ' THEN 'UK'
	 ELSE work_country
	 END

-- I delete rows, which contain mismatch data in work_country column

DELETE FROM Salary_Survey 
WHERE work_country = '$2,175.84/year is deducted for benefits' OR
      work_country = 'bonus based on meeting yearly goals set w/ my supervisor' OR
	  work_country = 'Y' OR
	  work_country = 'n/a (remote from wherever I want)' OR
	  work_country = 'International ' OR
	  work_country = 'I was brought in on this salary to help with the EHR and very quickly was promoted to current position but compensation was not altered. ' OR
	  work_country = 'From New Zealand but on projects across APAC' OR
	  work_country = 'europe' OR
	  work_country = '🇺🇸 ' OR
	  work_country = 'Currently finance' OR
	  work_country = 'Contracts' OR
	  work_country = 'europe'

-- Let's remove cells with special symbols

SELECT work_country, annual_salary
FROM Salary_Survey
ORDER BY work_country ASC

SELECT work_country, annual_salary, USA_city
FROM Salary_Survey
WHERE annual_salary = 37000 AND USA_city = 'Mashpee'

DELETE FROM Salary_Survey
WHERE annual_salary = 37000 AND USA_city = 'Mashpee'

SELECT work_country, annual_salary, job
FROM Salary_Survey
WHERE annual_salary = 74000 AND USA_city = 'Washington' AND job = 'Policy Adviser'
ORDER BY work_country DESC

DELETE FROM Salary_Survey
WHERE annual_salary = 74000 AND USA_city = 'Washington' AND job = 'Policy Adviser'

SELECT work_country, annual_salary, job
FROM Salary_Survey
WHERE annual_salary = 51000 AND job = 'Associate Account Executive' OR 
      annual_salary = 83000 AND job = 'Associate Director, Graduate & Postdoctoral Affairs' OR 
	  annual_salary = 240000 AND job = 'Audiovisual Translator'
ORDER BY work_country DESC

DELETE FROM Salary_Survey
WHERE annual_salary = 51000 AND job = 'Associate Account Executive' OR 
      annual_salary = 83000 AND job = 'Associate Director, Graduate & Postdoctoral Affairs' OR 
	  annual_salary = 240000 AND job = 'Audiovisual Translator'

-- Some countries I can't recognize, so I remove them from the sheet

DELETE FROM Salary_Survey
WHERE work_country = 'UXZ' OR 
      work_country = 'Remote' OR
	  work_country = 'Global' OR
	  work_country = 'Canada and USA' OR
	  work_country = 'Policy'

-- extra_compensation column has many NULL values, I replace it with 0.

SELECT ISNULL(extra_compesation, 0 ) 
FROM Salary_Survey

UPDATE Salary_Survey 
SET extra_compesation = 0 
WHERE extra_compesation IS NULL

-- For further analysis we will need work_field column, so it's time to clean it up and get it tp the same format.

SELECT DISTINCT(work_field), COUNT(work_field) AS number
FROM Salary_Survey
GROUP BY work_field 
ORDER BY number DESC

UPDATE Salary_Survey
SET work_field = CASE WHEN work_field = 'Public Library' THEN 'Library'
     WHEN work_field = 'Libraries' THEN 'Library'
	 WHEN work_field = 'Zoo' THEN 'Zoos and Aquariums'
	 WHEN work_field = 'Workforce development ' THEN 'Wine industry'
	 WHEN work_field = 'Winery regulatory compliance ' THEN 'Wine industry'
	 WHEN work_field = 'Wine Wholesale' THEN 'Wine industry'
	 WHEN work_field = 'Wine Importing/Distribution' THEN 'Wine industry'
	 WHEN work_field = 'Wine' THEN 'Wine industry'
	 WHEN work_field = 'Wholesale Trade' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Wholesale textile manufacture and sales' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Wholesale supplier ' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Wholesale Industrial & Welding Supplies & Equipment' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Wholesale Distribution B2B' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'wholesale distribution' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Wholesale and retail trade' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Wholesale - Apparel' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Wholesale' THEN 'Wholesale/Distrbution'
	 WHEN work_field = 'Warehousing' THEN 'Warehouse'
	 WHEN work_field = 'Warehouse- Food and Beverage ' THEN 'Warehouse'
	 WHEN work_field = 'Warehouse ' THEN 'Warehouse'
	 WHEN work_field = 'Veterinary medicine' THEN 'Veterinary services'
	 WHEN work_field = 'Veterinary m&a' THEN 'Veterinary services'
	 WHEN work_field = 'Veterinary Diagnostics' THEN 'Veterinary services'
	 WHEN work_field = 'Veterinary Care' THEN 'Veterinary services'
	 WHEN work_field = 'Video Game Industry ' THEN 'Video Games'
	 WHEN work_field = 'veterinary biotech' THEN 'Veterinary services'
	 WHEN work_field = 'Veterinary' THEN 'Veterinary services'
	 WHEN work_field = 'Veterinarian' THEN 'Veterinary services'
	 WHEN work_field = 'Vet' THEN 'Veterinary services'
	 WHEN work_field = 'Translation/transcription' THEN 'Translation'
	 WHEN work_field = 'Translation and Localization' THEN 'Translation'
	 WHEN work_field = 'trade association/membership' THEN 'Trade association'
	 WHEN work_field = 'Trade Associations' THEN 'Trade association'
	 WHEN work_field = 'Trades (Supply Chain) Oil and Gas' THEN 'Trade association'
	 WHEN work_field = 'Tourism/Heritage -- but for a government building' THEN 'Tourism'
	 WHEN work_field = 'Travel ' THEN 'Tourism'
	 WHEN work_field = 'Third sector/non profit - medical membership in UK' THEN 'Nonprofits'
	 WHEN work_field = 'Title/Real Estate ' THEN 'Real Estate'
	 WHEN work_field = 'Technical/Cybersecurity' THEN 'Tech'
	 WHEN work_field = 'Technology' THEN 'Tech'
	 WHEN work_field = 'technology/SaaS' THEN 'Tech'
	 WHEN work_field = 'Technical/IT' THEN 'Tech'
	 WHEN work_field = 'Tabletop Games Publishing' THEN 'Tabletop Gaming'
	 WHEN work_field = 'Surveying ' THEN 'Surveying'
	 WHEN work_field = 'Survey Research/Public Policy Research' THEN 'Surveying'
	 WHEN work_field = 'Survey methodology' THEN 'Surveying'
	 WHEN work_field = 'Supply Chain!' THEN 'Supply Chain'
	 WHEN work_field = 'Supply Chain Operations' THEN 'Supply Chain'
	 WHEN work_field = 'Supply Chain Distribution ' THEN 'Supply Chain'
	 WHEN work_field = 'Supply chain' THEN 'Supply Chain'
	 WHEN work_field = 'strategy consulting' THEN 'Strategy'
	 WHEN work_field = 'STEM medical research' THEN 'STEM research'
	 WHEN work_field = 'Staffing Industrry' THEN 'Staffing Industry'
	 WHEN work_field = 'Staffing Firm' THEN 'Staffing Industry'
	 WHEN work_field = 'Staffing agency' THEN 'Staffing Industry'
	 WHEN work_field = 'Staffing & workforce solutions ' THEN 'Staffing Industry'
	 WHEN work_field = 'Soldier' THEN 'Military'
	 WHEN work_field = 'Software/programming' THEN 'Software Development'
	 WHEN work_field = 'Software Products' THEN 'Software Development'
	 WHEN work_field = 'Software Development / IT' THEN 'Software Development'
	 WHEN work_field = 'Software as a Service SaaS' THEN 'Software Development'
	 WHEN work_field = 'Software' THEN 'Software Development'
	 WHEN work_field = 'Social sciences research' THEN 'Social Research'
	 WHEN work_field = 'social science research - not quite academia, not quite nonprofit, not quite consulting' THEN 'Social Research'
	 WHEN work_field = 'Social science ' THEN 'Social Research'
	 WHEN work_field = 'Security and manufacturing company' THEN 'Security'
	 WHEN work_field = 'Sign Language Interpreter, Community' THEN 'Translation'
	 WHEN work_field = 'Scientist' THEN 'Science'
	 WHEN work_field = 'Scientific research (industry) ' THEN 'Science'
	 WHEN work_field = 'Scientific Research' THEN 'Science'
	 WHEN work_field = 'Scientific R&D' THEN 'Science'
	 WHEN work_field = 'Scientific publishing' THEN 'Science'
	 WHEN work_field = 'Scientific analysis' THEN 'Science'
	 WHEN work_field = 'Scientific' THEN 'Science'
	 WHEN work_field = 'Sciences' THEN 'Science'
	 WHEN work_field = 'Science/research non-academic' THEN 'Science'
	 WHEN work_field = 'Science/Research (Academia)' THEN 'Science'
	 WHEN work_field = 'Science/Research' THEN 'Science'
	 WHEN work_field = 'Science/government ' THEN 'Science'
	 WHEN work_field = 'Science/Biotech ' THEN 'Science'
	 WHEN work_field = 'Science Research, government' THEN 'Science'
	 WHEN work_field = 'Science Research' THEN 'Science'
	 WHEN work_field = 'Science publishing' THEN 'Science'
	 WHEN work_field = 'Science and reasearch' THEN 'Science'
	 WHEN work_field = 'Science and Natural Resource Management' THEN 'Science'
	 WHEN work_field = 'Science academia' THEN 'Science'
	 WHEN work_field = 'Science (Research, Biology)' THEN 'Science'
	 WHEN work_field = 'Science (Laboratory)' THEN 'Science'
	 WHEN work_field = 'Science (Chemistry R&D)' THEN 'Science'
	 WHEN work_field = 'Science - QC lab' THEN 'Science'
	 WHEN work_field = 'Sales Operations ' THEN 'Sales'
	 WHEN work_field = 'Saas company/software' THEN 'Software Development'
	 WHEN work_field = 'Saas' THEN 'Software Development'
	 WHEN work_field = 'Retail real estate' THEN 'Retail'
	 WHEN work_field = 'Retail pharmacy' THEN 'Retail'
	 WHEN work_field = 'Retail mid level management' THEN 'Retail'
	 WHEN work_field = 'Retail call center ' THEN 'Retail'
	 WHEN work_field = 'Restaurant/Service' THEN 'Restaurants & Hospitality'
	 WHEN work_field = 'Restaurant/Food Service' THEN 'Restaurants & Hospitality'
	 WHEN work_field = 'Restaurant Group ' THEN 'Restaurants & Hospitality'
	 WHEN work_field = 'Restaurant ' THEN 'Restaurants & Hospitality'
	 WHEN work_field = 'Research/Social Science' THEN 'Research'
	 WHEN work_field = 'Research/Academia' THEN 'Research'
	 WHEN work_field = 'Research Scientist, Pharma' THEN 'Research'
	 WHEN work_field = 'Research science' THEN 'Research'
	 WHEN work_field = 'Research Institute' THEN 'Research'
	 WHEN work_field = 'Research at a State University' THEN 'Research'
	 WHEN work_field = 'Research at a National Laboratory' THEN 'Research'
	 WHEN work_field = 'Research and Evaluation' THEN 'Research'
	 WHEN work_field = 'Research and Development, Food and Beverage ' THEN 'Research'
	 WHEN work_field = 'Research and Development Academia' THEN 'Research'
	 WHEN work_field = 'Research and development' THEN 'Research'
	 WHEN work_field = 'Research Administration' THEN 'Research'
	 WHEN work_field = 'Research (health)' THEN 'Research'
	 WHEN work_field = 'Real World Evidence (data for pharma research)' THEN 'Research'
	 WHEN work_field = 'Research & Development (Physical Sciences)' THEN 'Research'
	 WHEN work_field = 'Research & DevelopmentResearch & Development (Defense Industry)' THEN 'Research'
	 WHEN work_field = 'Research - Public Health' THEN 'Research'
	 WHEN work_field = 'Research - academic' THEN 'Research'
	 WHEN work_field = 'Renewable fuels' THEN 'Renewable Energy'
	 WHEN work_field = 'Renewable Energy Development' THEN 'Renewable Energy'
	 WHEN work_field = 'Religious institute' THEN 'Religious institution'
	 WHEN work_field = 'Religious institute' THEN 'Religious institution'
	 WHEN work_field = 'religious educator' THEN 'Religious institution'
	 WHEN work_field = 'Religious (synagogue)' THEN 'Religious institution'
	 WHEN work_field = 'Religious (church)' THEN 'Religious institution'
	 WHEN work_field = 'Religious' THEN 'Religious institution'
	 WHEN work_field = 'Religion/church' THEN 'Religious institution'
	 WHEN work_field = 'Religion' THEN 'Religious institution'
	 WHEN work_field = 'Regulatory Affairs- nutraceuticals ' THEN 'Regulatory Affairs'
	 WHEN work_field = 'Real estate: title & escrow' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate/Development' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate/ Mortgage ' THEN 'Real Estate'
	 WHEN work_field = 'Real estate valuation' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate Title Company' THEN 'Real Estate'
	 WHEN work_field = 'Real estate software' THEN 'Real Estate'
	 WHEN work_field = 'Real estate services' THEN 'Real Estate'
	 WHEN work_field = 'Real estate servicea' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate Investment Support' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate Investment' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate Development' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate customer care' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate Corp. Office/not a Realtor' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate Association ' THEN 'Real Estate'
	 WHEN work_field = 'Real Estate Affordable Housing' THEN 'Real Estate'
	 WHEN work_field = 'R&D in Manufacturing' THEN 'R&D'
	 WHEN work_field = 'Quality Assurance Laboratory ' THEN 'Quality Assurance'
	 WHEN work_field = 'University research' THEN 'Research'
	 WHEN work_field = 'STEM research' THEN 'Research'
	 WHEN work_field = 'Research & Development (Defense Industry)' THEN 'Research'
	 WHEN work_field = 'Research & Development' THEN 'Research'
	 WHEN work_field = 'Publishing: Science, Academic, Technical ' THEN 'Publishing'
	 WHEN work_field = 'publishing/edtech' THEN 'Publishing'
	 WHEN work_field = 'Publishing, content as a service' THEN 'Publishing'
	 WHEN work_field = 'Publishing (book)' THEN 'Publishing'
	 WHEN work_field = 'Publishing (academic)' THEN 'Publishing'
	 WHEN work_field = 'Publishibg' THEN 'Publishing'
	 WHEN work_field = 'Publications' THEN 'Publishing'
	 WHEN work_field = 'Public Opinion Research' THEN 'Research'
	 WHEN work_field = 'Public/Research Library' THEN 'Research'
	 WHEN work_field = 'Public Library (technically City Govt.?) ' THEN 'Public Libraries'
	 WHEN work_field = 'Public Library (Non-profit, but also government?)' THEN 'Public Libraries'
	 WHEN work_field = 'Public Library (might be considered Government, but that always seems an odd designation...)' THEN 'Public Libraries'
	 WHEN work_field = 'Public Librarian' THEN 'Public Libraries'
	 WHEN work_field = 'Health care' THEN 'Health Care'
	 WHEN work_field = 'Public Health, local government' THEN 'Health Care'
	 WHEN work_field = 'Public Health- state level' THEN 'Health Care'
	 WHEN work_field = 'Public Health Research' THEN 'Health Care'
	 WHEN work_field = 'Public health in higher education' THEN 'Health Care'
	 WHEN work_field = 'Public health (not medical)' THEN 'Health Care'
	 WHEN work_field = 'Public Health' THEN 'Health Care'
	 WHEN work_field = 'Psychology' THEN 'Health Care'
	 WHEN work_field = 'Psychologist' THEN 'Health Care'
	 WHEN work_field = 'Psychologist' THEN 'Product Management'
	 WHEN work_field = 'Print publishing' THEN 'Publishing'
	 WHEN work_field = 'Politics/Government Relations' THEN 'Politics'
	 WHEN work_field = 'Politics/Campaigns' THEN 'Politics'
	 WHEN work_field = 'Political Research' THEN 'Politics'
	 WHEN work_field = 'Political Consulting' THEN 'Politics'
	 WHEN work_field = 'Political Campaigns' THEN 'Politics'
	 WHEN work_field = 'Political Campaigning' THEN 'Politics'
	 WHEN work_field = 'political campaign' THEN 'Politics'
	 WHEN work_field = 'Pharmacuticals' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceuticals/Biotechnology' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceuticals R&D' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceuticals / Biotech' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical/Contract Research Organization' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical/biotechnology' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical/Biotech' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical research (chemist)' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical research & development' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical research' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical R&D' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical Manufacturing' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical Industry' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical Development' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical company ' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceutical' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharmaceitical manufacturing' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharma/biotechnology ' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharma/Biotech' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharma/ Research' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharma research' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharma R&D' THEN 'Pharmaceuticals'
	 WHEN work_field = 'pharma / medical device design and manufacturing' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pharma & Biotech' THEN 'Pharmaceuticals'
	 WHEN work_field = 'pharma' THEN 'Pharmaceuticals'
	 WHEN work_field = 'Pet care/grooming' THEN 'Pet Care'
	 WHEN work_field = 'Pet care industry (dog training/walking)' THEN 'Pet Care'
	 WHEN work_field = 'Pet care industry ' THEN 'Pet Care'
	 WHEN work_field = 'Pet' THEN 'Pet Care'
	 WHEN work_field = 'Per Sitter' THEN 'Pet Care'
	 WHEN work_field = 'Online learning' THEN 'Ed Tech'
	 WHEN work_field = 'Online education startup (non-technical role)' THEN 'Ed Tech'
	 WHEN work_field = 'Online education' THEN 'Ed Tech'
	 WHEN work_field = 'Oilfield adjacent' THEN 'Oil & Gas'
	 WHEN work_field = 'Oil and Gas Safety Training' THEN 'Oil & Gas'
	 WHEN work_field = 'Oil and gas exploration' THEN 'Oil & Gas'
	 WHEN work_field = 'Oil and Gas' THEN 'Oil & Gas'
	 WHEN work_field = 'Oil & Gas - Non Destructive Testing' THEN 'Oil & Gas'
	 WHEN work_field = 'Oil' THEN 'Oil & Gas'
	 WHEN work_field = 'not-for-profit membership organization' THEN 'Nonprofits'
	 WHEN work_field = 'not-for-profit health research consulting' THEN 'Nonprofits'
	 WHEN work_field = 'Not for profit education consultancy' THEN 'Nonprofits'
	 WHEN work_field = 'Non-profit Theatre' THEN 'Nonprofits'
	 WHEN work_field = 'Nonprofit scholarly society publisher' THEN 'Nonprofits'
	 WHEN work_field = 'Non-profit health care (I couldn’t select both)' THEN 'Nonprofits'
	 WHEN work_field = 'Nonprofit association' THEN 'Nonprofits'
	 WHEN work_field = 'Nonprofit - LORT D Theater' THEN 'Nonprofits'
	 WHEN work_field = 'Nonprofit - legal department' THEN 'Nonprofits'
	 WHEN work_field = 'Non profit theater' THEN 'Nonprofits'
	 WHEN work_field = 'Music: freelance, performing and education' THEN 'Music'
	 WHEN work_field = 'Music, education ' THEN 'Music'
	 WHEN work_field = 'music therapy ' THEN 'Music'
	 WHEN work_field = 'Music Licensing' THEN 'Music'
	 WHEN work_field = 'Museums: Nonprofit' THEN 'Museum'
	 WHEN work_field = 'museums & archives (not sure where this would fall)' THEN 'Museum'
	 WHEN work_field = 'Museums & archives' THEN 'Museum'
	 WHEN work_field = 'Museums' THEN 'Museum'
	 WHEN work_field = 'Museum Library' THEN 'Museum'
	 WHEN work_field = 'Museum education ' THEN 'Museum'
	 WHEN work_field = 'Museum (<20 employees)' THEN 'Museum'
	 WHEN work_field = 'Museum - Nonprofit' THEN 'Museum'
	 WHEN work_field = 'Municipal library' THEN 'Public Libraries'
	 WHEN work_field = 'Municipal Government (Library)' THEN 'Public Libraries'
	 WHEN work_field = 'municipal (public) libraries' THEN 'Public Libraries'
	 WHEN work_field = 'Mining/Resource Extraction' THEN 'Mining'
	 WHEN work_field = 'Mining/Mineral Exploration' THEN 'Mining'
	 WHEN work_field = 'Mining and natural resources' THEN 'Mining'
	 WHEN work_field = 'Mining & Mineral Processing' THEN 'Mining'
	 WHEN work_field = 'Mental health therapist' THEN 'Health Care'
	 WHEN work_field = 'Mental health ' THEN 'Health Care'
	 WHEN work_field = 'Medical/Pharmaceutical ' THEN 'Health Care'
	 WHEN work_field = 'Medical Technology' THEN 'Health Care'
	 WHEN work_field = 'Medical supply Wholesale & Warehousing' THEN 'Health Care'
	 WHEN work_field = 'Medical Sciences' THEN 'Health Care'
	 WHEN work_field = 'Medical research' THEN 'Health Care'
	 WHEN work_field = 'Medica education' THEN 'Health Care'
	 WHEN work_field = 'Medical research' THEN 'Research'
	 WHEN work_field = 'Marketing technology' THEN 'Marketing, Advertising & PR'
	 WHEN work_field = 'Marketing at a Non Profit' THEN 'Marketing, Advertising & PR'
	 WHEN work_field = 'Market Research ' THEN 'Marketing, Advertising & PR'
	 WHEN work_field = 'Manufacturing ' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing/Wholesale' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing/Consumer Packaged Goods' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing, Chemical' THEN 'Manufacturing'
	 WHEN work_field = 'manufacturing security systems' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing and distributing' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing : corporate admin support' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing (pharmaceuticals) ' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing (personal care)' THEN 'Manufacturing'
	 WHEN work_field = 'Manufacturing (medical devices)' THEN 'Manufacturing'
	 WHEN work_field = 'Life sciences (not in academia)' THEN 'Life Sciences'
	 WHEN work_field = 'Life science capability development' THEN 'Life Sciences'
	 WHEN work_field = 'Library--public' THEN 'Public Libraries'
	 WHEN work_field = 'Library/Information managment' THEN 'Public Libraries'
	 WHEN work_field = 'Library/archives' THEN 'Public Libraries'
	 WHEN work_field = 'Library/Archive/Research Center' THEN 'Public Libraries'
	 WHEN work_field = 'Library/Archive' THEN 'Public Libraries'
	 WHEN work_field = 'Library Tech for a school system' THEN 'Public Libraries'
	 WHEN work_field = 'Library science / part-time work/study' THEN 'Public Libraries'
	 WHEN work_field = 'Library Page (Public county library)' THEN 'Public Libraries'
	 WHEN work_field = 'Library at a University ' THEN 'Public Libraries'
	 WHEN work_field = 'Library and Information Services' THEN 'Public Libraries'
	 WHEN work_field = 'Library and Information Science' THEN 'Public Libraries'
	 WHEN work_field = 'Library (university)' THEN 'Public Libraries'
	 WHEN work_field = 'Library (its a non-profit and its a govt job - how would I list that? Not all libraries are govt jobs)' THEN 'Public Libraries'
	 WHEN work_field = 'Library' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries/Museums/Archives' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries/Archives' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries and Archives (Academic)' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries and Archives' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries / Archives / Information' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries (Public)' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries (Medical)' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries (Medical)' THEN 'Public Libraries'
	 WHEN work_field = 'Libraries & Archives' THEN 'Public Libraries'
	 WHEN work_field = 'librarian--Contractor for NASA' THEN 'Public Libraries'
	 WHEN work_field = 'Librarian in legal setting' THEN 'Public Libraries'
	 WHEN work_field = 'Librarian and Assistant Manager of a library' THEN 'Public Libraries'
	 WHEN work_field = 'Librarian ' THEN 'Public Libraries'
	 WHEN work_field = 'Law Library' THEN 'Public Libraries'
	 WHEN work_field = 'Law Enforcement & Security' THEN 'Law'
	 WHEN work_field = 'Language Services company, unsure the broad category to use. Our clients are branding agencies, and their clients are frequently (but not always) pharmaceutical companies.' THEN 'Language Services'
	 WHEN work_field = 'Landed Estate' THEN 'Real Estate'
	 WHEN work_field = 'Landscaping/Tree Work' THEN 'Landscaping'
	 WHEN work_field = 'Landscape Contracting' THEN 'Landscaping'
	 WHEN work_field = 'Landscape Architecture' THEN 'Landscaping'
	 WHEN work_field = 'Laboratory research' THEN 'Research'
	 WHEN work_field = 'labor union' THEN 'Labor'
	 WHEN work_field = 'It security ' THEN 'Tech'
	 WHEN work_field = 'IT MSP' THEN 'Tech'
	 WHEN work_field = 'IT' THEN 'Tech'
	 WHEN work_field = 'Information technology (IT)' THEN 'Tech'
	 WHEN work_field = 'Information Technology ' THEN 'Tech'
	 WHEN work_field = 'In-House Marketing' THEN 'Marketing, Advertising & PR'
	 WHEN work_field = 'Information Services/Libraries' THEN 'Public Libraries'
	 WHEN work_field = 'Information services (library)' THEN 'Public Libraries'
	 WHEN work_field = 'Information services (libraries)' THEN 'Public Libraries'
	 WHEN work_field = 'Information services' THEN 'Public Libraries'
	 WHEN work_field = 'Information Management/Archives' THEN 'Public Libraries'
	 WHEN work_field = 'Higher education/Libraries' THEN 'Public Libraries'
	 WHEN work_field = 'Heritage/Public History' THEN 'Heritage'
	 WHEN work_field = 'Healthcare technology ' THEN 'Health care'
	 WHEN work_field = 'Healthcare IT' THEN 'Health care'
	 WHEN work_field = 'Healthcare Information Technology' THEN 'Health care'
	 WHEN work_field = 'Health Research' THEN 'Health care'
	 WHEN work_field = 'Health Insurance ' THEN 'Health care'
	 WHEN work_field = 'Health and Safety' THEN 'Health care'
	 WHEN work_field = 'Health and fitness' THEN 'Health care'
	 WHEN work_field = 'Government Relations/Lobbying' THEN 'Government Relations'
	 WHEN work_field = 'Government Relation' THEN 'Government Relations'
	 WHEN work_field = 'government contractor, international development' THEN 'Government Contracting'
	 WHEN work_field = 'Government Contractor (R&D)' THEN 'Government Contracting'
	 WHEN work_field = 'Government contractor' THEN 'Government Contracting'
	 WHEN work_field = 'Government Contracting R&D' THEN 'Government Contracting'
	 WHEN work_field = 'Government contracting (data analytics and program evaluations)' THEN 'Government Contracting'
	 WHEN work_field = 'Government contract ' THEN 'Government Contracting'
	 WHEN work_field = 'Gas & Oil' THEN 'Oil & Gas'
	 WHEN work_field = 'Gaming (Gambling)' THEN 'Game development'
	 WHEN work_field = 'Gaming' THEN 'Game development'
	 WHEN work_field = 'Games development' THEN 'Game development'
	 WHEN work_field = 'Gambling' THEN 'Game development'
	 WHEN work_field = 'Funeral Service ' THEN 'Funeral Service'
	 WHEN work_field = 'Funeral services' THEN 'Funeral Service'
	 WHEN work_field = 'Funeral ' THEN 'Funeral Service'
	 WHEN work_field = 'Fundraising in Higher Education; nonclinical, nonacademic' THEN 'Fundraising'
	 WHEN work_field = 'Fundraising for a university ' THEN 'Fundraising'
	 WHEN work_field = 'Funding Intermediary ' THEN 'Fundraising'
	 WHEN work_field = 'Foodservice' THEN 'Food Service'
	 WHEN work_field = 'Food/Quick Service Restaurant (QSR)' THEN 'Food Service'
	 WHEN work_field = 'Food Service --- Baking' THEN 'Food Service'
	 WHEN work_field = 'Food/Beverage Manufacturing- Quality/Laboratory' THEN 'Food Service'
	 WHEN work_field = 'Food Production/Processing' THEN 'Food Service'
	 WHEN work_field = 'Food production' THEN 'Food Service'
	 WHEN work_field = 'Food processing and packaging' THEN 'Food Service'
	 WHEN work_field = 'Food Processing' THEN 'Food Service'
	 WHEN work_field = 'Food manufacturing' THEN 'Food Service'
	 WHEN work_field = 'Food manufacturers ' THEN 'Food Service'
	 WHEN work_field = 'Food Manufacture' THEN 'Food Service'
	 WHEN work_field = 'Food industry ' THEN 'Food Service'
	 WHEN work_field = 'Food distribution' THEN 'Food Service'
	 WHEN work_field = 'Food demos' THEN 'Food Service'
	 WHEN work_field = 'Food and Flavor' THEN 'Food Service'
	 WHEN work_field = 'Food and Drink ' THEN 'Food Service'
	 WHEN work_field = 'Food and Beverage ' THEN 'Food Service'
	 WHEN work_field = 'Food & Nutrition' THEN 'Food Service'
	 WHEN work_field = 'Food & Beverages' THEN 'Food Service'
	 WHEN work_field = 'Food & Beverage production' THEN 'Food Service'
	 WHEN work_field = 'Food & Beverage' THEN 'Food Service'
	 WHEN work_field = 'Food' THEN 'Food Service'
	 WHEN work_field = 'Fast Food' THEN 'Food Service'
	 WHEN work_field = 'Fast casual restaurant ' THEN 'Food Service'
	 WHEN work_field = 'Fitness & Entertainment' THEN 'Fitness'
	 WHEN work_field = 'FinTech/Payment Processing' THEN 'Fintech'
	 WHEN work_field = 'Finance/Investment Management but in legal/compliance, so back-office' THEN 'Fintech'
	 WHEN work_field = 'finance' THEN 'Fintech'
	 WHEN work_field = 'Fashion/e-commerce ' THEN 'E-commerce'
	 WHEN work_field = 'Educational Technology - hybrid between book publishing and technology really' THEN 'Ed Tech'
	 WHEN work_field = 'Educational technology' THEN 'Ed Tech'
	 WHEN work_field = 'Educational Research' THEN 'Ed Tech'
	 WHEN work_field = 'Educational publishing / ed tech' THEN 'Publishing'
	 WHEN work_field = 'Educational Publishing' THEN 'Publishing'
	 WHEN work_field = 'Education Publishing ' THEN 'Publishing'
	 WHEN work_field = 'Editor in educational publishing' THEN 'Publishing'
	 WHEN work_field = 'Educ tech' THEN 'Ed Tech'
	 WHEN work_field = 'Edtech' THEN 'Ed Tech'
	 WHEN work_field = 'Ed Tech' THEN 'Ed Tech'
	 WHEN work_field = 'Ecommerce fraud' THEN 'E-commerce'
	 WHEN work_field = 'Ecommerce - Technology' THEN 'E-commerce'
	 WHEN work_field = 'E-commerce' THEN 'E-commerce'
	 WHEN work_field = 'ECommerce ' THEN 'E-commerce'
	 WHEN work_field = 'e-comm' THEN 'E-commerce'
	 WHEN work_field = 'e-comm' THEN 'E-commerce'
	 WHEN work_field = 'digital commerce / ecommerce' THEN 'E-commerce'
	 WHEN work_field = 'Early Education (corporate office)' THEN 'Early Education'
	 WHEN work_field = 'Early childhood education (preschool)' THEN 'Early Education'
	 WHEN work_field = 'Early childhood education' THEN 'Early Education'
	 WHEN work_field = 'Education (early childhood)' THEN 'Early Education'
	 WHEN work_field = 'Education: preschool ' THEN 'Early Education'
	 WHEN work_field = 'Digital Marketing' THEN 'Marketing, Advertising & PR'
	 WHEN work_field = 'Computing/Tech + Higher Ed + Nonprofit' THEN 'Computing or Tech'
	 WHEN work_field = 'Construction / Stone industry' THEN 'Construction'
	 WHEN work_field = 'Construction, mining, manufacturing' THEN 'Construction'
	 WHEN work_field = 'Construction, HVAC ' THEN 'Construction'
	 WHEN work_field = 'Construction Management' THEN 'Construction'
	 WHEN work_field = 'Communications/publications' THEN 'Communications'
	 WHEN work_field = 'Communication Research' THEN 'Communications'
	 WHEN work_field = 'Commercial real estate tenancy' THEN 'Real Estate'
	 WHEN work_field = 'Commercial Real Estate Data and Analytics/Research' THEN 'Real Estate'
	 WHEN work_field = 'Commercial Real Estate - Private Equity' THEN 'Real Estate'
	 WHEN work_field = 'Commercial Real Estate ' THEN 'Real Estate'
	 WHEN work_field = 'Commercial Landscaping ' THEN 'Real Estate'
	 WHEN work_field = 'clinical trials research coordination' THEN 'Research'
	 WHEN work_field = 'Clinical Research Manager - academic institution' THEN 'Research'
	 WHEN work_field = 'Clinical research and development ' THEN 'Research'
	 WHEN work_field = 'clinical research' THEN 'Research'
	 WHEN work_field = 'Clinical & Translational Reserach' THEN 'Research'
	 WHEN work_field = 'Childcare (0-5 so does not come under Primary education)' THEN 'Early Education'
	 WHEN work_field = 'Childcare' THEN 'Early Education'
	 WHEN work_field = 'Child care' THEN 'Early Education'
	 WHEN work_field = 'Child and Yout Care' THEN 'Early Education'
	 WHEN work_field = 'Business Services' THEN 'Business or Consulting'
	 WHEN work_field = 'Business Process Outsourcing' THEN 'Business or Consulting'
	 WHEN work_field = 'Cancer research, not for profit' THEN 'Research'
	 WHEN work_field = 'Business Process Outsourcing' THEN 'Business or Consulting'
	 WHEN work_field = 'Business Services' THEN 'Business or Consulting'
	 WHEN work_field = 'Brain research ' THEN 'Research'
	 WHEN work_field = 'Book Publishing' THEN 'Publishing'
	 WHEN work_field = 'Bitech' THEN 'Biotechnology'
	 WHEN work_field = 'Biotechnology/Life Sciences' THEN 'Biotechnology'
	 WHEN work_field = 'Biotechnology, Research and Development' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech/software' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech/pharmaceuticals ' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech/Pharma' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech/Food Safety' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech/Drug Development' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech research ' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech R&D' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech pharmaceuticals' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech manufacturing' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech industry' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech / Research' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech / Pharmaceutical Industry' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech / life sciences ' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech (R&D) ' THEN 'Biotechnology'
	 WHEN work_field = 'Biotech' THEN 'Biotechnology'
	 WHEN work_field = 'Bioscience Company' THEN 'Biotechnology'
	 WHEN work_field = 'Biopharmaceuticals' THEN 'Biotechnology'
	 WHEN work_field = 'Biopharma' THEN 'Biotechnology'
	 WHEN work_field = 'Biomedical Research' THEN 'Biotechnology'
	 WHEN work_field = 'Bio tech' THEN 'Biotechnology'
	 WHEN work_field = 'Bioinformatics ' THEN 'Biotechnology'
	 WHEN work_field = 'Beverage Production' THEN 'Food Service'
	 WHEN work_field = 'Beverage Distribution' THEN 'Food Service'
	 WHEN work_field = 'Beverage & Spirits' THEN 'Food Service'
	 WHEN work_field = 'Beverage' THEN 'Food Service'
	 WHEN work_field = 'Arts, Culture and Heritage' THEN 'Art & Design'
	 WHEN work_field = 'Arts Administration ' THEN 'Art & Design'
	 WHEN work_field = 'art appraisal' THEN 'Art & Design'
	 WHEN work_field = 'Archives/Library Science' THEN 'Public Library'
	 WHEN work_field = 'Archives/Libraries' THEN 'Public Library'
	 WHEN work_field = 'Archives' THEN 'Public Library'
	 WHEN work_field = 'Architecture/Construction' THEN 'Architecture'
	 WHEN work_field = 'Architecture, Engineering, Construction' THEN 'Architecture'
	 WHEN work_field = 'Architecture and engineering consulting and design ' THEN 'Architecture'
	 WHEN work_field = 'Architecture / Engineering' THEN 'Architecture'
	 WHEN work_field = 'Architecture & Construction' THEN 'Architecture'
	 WHEN work_field = 'Architectural/Land Planning/Civil Engineering' THEN 'Architecture'
	 WHEN work_field = 'Architect' THEN 'Architecture'
	 WHEN work_field = 'Archaeology/Cultural Resource Manager' THEN 'Archaeology'
	 WHEN work_field = 'Archaeology / Cultural Resource Management' THEN 'Archaeology'
	 WHEN work_field = 'Archaeologist' THEN 'Archaeology'
	 WHEN work_field = 'Animal welfare' THEN 'Animal Care'
	 WHEN work_field = 'Animal Health Product Manufacturing' THEN 'Animal Care'
	 WHEN work_field = 'Animal health industry' THEN 'Animal Care'
	 WHEN work_field = 'Animal Health' THEN 'Animal Care'
	 WHEN work_field = 'Animal Caretaker' THEN 'Animal Care'
	 WHEN work_field = 'Agriculture/Agriculture Chemical ' THEN 'Agriculture or Forestry'
	 WHEN work_field = 'Aerospace & Defense' THEN 'Aerospace'
	 WHEN work_field = 'Aerospace and Defense' THEN 'Aerospace'
	 WHEN work_field = 'Aerospace and Defense Manufacturing' THEN 'Aerospace'
	 WHEN work_field = 'Aerospace and Defense/Government Contracting' THEN 'Aerospace'
	 WHEN work_field = 'Aerospace contracting' THEN 'Aerospace'
	 WHEN work_field = 'aerospace data' THEN 'Aerospace'
	 WHEN work_field = 'Aerospace Manufacturing' THEN 'Aerospace'
	 WHEN work_field = 'Aerospace/Aviation ' THEN 'Aerospace'
	 WHEN work_field = 'Aerospace/Defense' THEN 'Aerospace'
	 WHEN work_field = 'Affordable Housing Real Estate Development (nonprofit)' THEN 'Real Eastate'
	 WHEN work_field = 'Academic Scientific Research' THEN 'Research'
	 WHEN work_field = 'Academic/nonprofit research' THEN 'Research'
	 WHEN work_field = 'Academic research (social science)' THEN 'Research'
	 WHEN work_field = 'Academic research (Psychology)' THEN 'Research'
	 WHEN work_field = 'Academic research' THEN 'Research'
	 WHEN work_field = 'Academic Publishing' THEN 'Publishing'
	 WHEN work_field = 'Academia / Research' THEN 'Research'	
	 ELSE work_field
	 END


-- Adjust number of years in columns

SELECT DISTINCT(years_of_experience), COUNT(years_of_experience) AS number
FROM Salary_Survey
GROUP BY years_of_experience 
ORDER BY number DESC

UPDATE Salary_Survey
SET years_of_experience = CASE WHEN years_of_experience = '5-7 years' THEN '5 - 7 years'
ELSE years_of_experience
	 END

UPDATE Salary_Survey
SET years_of_experience_field = CASE WHEN years_of_experience_field = '5-7 years' THEN '5 - 7 years'
ELSE years_of_experience_field
	 END


-- Mismatch currency

SELECT DISTINCT (currency), COUNT(currency) AS number
FROM Salary_Survey
GROUP BY currency
ORDER BY number DESC

UPDATE Salary_Survey
SET currency = CASE WHEN currency = 'American Dollars' THEN 'USD'
    WHEN currency = 'US Dollar' THEN 'USD'
	WHEN currency = 'Argentinian peso (ARS)' THEN 'Argentine Peso'
	WHEN currency = 'Peso Argentino' THEN 'Argentine Peso'
	WHEN currency = 'ARS' THEN 'Argentine Peso'
	WHEN currency = 'AUD Australian ' THEN 'AUD'
	WHEN currency = 'Australian Dollars ' THEN 'AUD'
	WHEN currency = 'BR$' THEN 'BRL'
	WHEN currency = 'BRL (R$)' THEN 'BRL'
	WHEN currency = 'China RMB' THEN 'CNY'
	WHEN currency = 'RMB (chinese yuan)' THEN 'CNY'
	WHEN currency = 'RM' THEN 'CNY'
	WHEN currency = 'czech crowns' THEN 'CZK'
	WHEN currency = 'Czk' THEN 'CZK'
	WHEN currency = 'Danish Kroner' THEN 'DKK'
	WHEN currency = 'Dkk' THEN 'DKK'
	WHEN currency = 'Euro' THEN 'EUR'
	WHEN currency = 'ILS (Shekel)' THEN 'ILS'
	WHEN currency = 'NIS (new Israeli shekel)' THEN 'ILS'
	WHEN currency = 'Ils' THEN 'ILS'
	WHEN currency = 'ILS/NIS' THEN 'ILS'
	WHEN currency = 'Indian rupees' THEN 'INR'
	WHEN currency = 'INR (Indian Rupee)' THEN 'INR'
	WHEN currency = 'Rupees' THEN 'INR'
	WHEN currency = 'Israeli Shekels' THEN 'ILS'
	WHEN currency = 'Korean Won ' THEN 'KRW'
	WHEN currency = 'KRW (Korean Won)' THEN 'KRW'
	WHEN currency = 'Mexican pesos' THEN 'MXN'
	WHEN currency = 'Philippine Peso' THEN 'PHP'
	WHEN currency = 'Philippine peso (PHP)' THEN 'PHP'
	WHEN currency = 'Philippine Pesos' THEN 'PHP'
	WHEN currency = 'PhP (Philippine Peso)' THEN 'PHP'
	WHEN currency = 'PLN (Polish zloty)' THEN 'PLN'
	WHEN currency = 'PLN (Zwoty)' THEN 'PLN'
	WHEN currency = 'Polish Złoty' THEN 'PLN'
	WHEN currency = 'Thai Baht ' THEN 'THB'
	WHEN currency = 'THAI  BAHT' THEN 'THB'
	WHEN currency = 'Norwegian kroner (NOK)' THEN 'NOK'
	ELSE currency
	END

-- Some numbers in the annual_salary column are too high, so I get rid of them with a help of Standart Deviation.
-- First, we have to find AVG and STD

SELECT annual_salary, currency
FROM Salary_Survey
ORDER BY annual_salary DESC

SELECT annual_salary, job
FROM Salary_Survey
WHERE currency = 'USD'
ORDER BY annual_salary DESC

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'USD'

-- We got 2 numbers. To exclude very high salaries we should add them.

DECLARE @addvalue INT;  
SET @addvalue = 674475;  
SELECT '96945' + @addvalue;  

-- We've got '771420' for salary in USD, I remove salaries which are higher than this.

DELETE FROM Salary_Survey
WHERE annual_salary > 771420 AND currency = 'USD'

-- Let's do the same for other currencies.

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'KRW'

DECLARE @addvalue INT;  
SET @addvalue = 6034898;  
SELECT '36200000' + @addvalue;  

DELETE FROM Salary_Survey
WHERE annual_salary > 42234898 AND currency = 'KRW'

----------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'JPY'

DECLARE @addvalue INT;  
SET @addvalue = 4063084;  
SELECT '6049673' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 10112757 AND currency = 'JPY'

--------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'INR'

DECLARE @addvalue INT;  
SET @addvalue = 1014219;  
SELECT '1701923' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 2716142 AND currency = 'INR'

---------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'SEK'

DECLARE @addvalue INT;  
SET @addvalue = 352408;  
SELECT '554798' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 907206 AND currency = 'SEK'

-----------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'DKK'

DECLARE @addvalue INT;  
SET @addvalue = 624725;  
SELECT '279658' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 904383 AND currency = 'DKK'

-------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'ZAR'

DECLARE @addvalue INT;  
SET @addvalue = 374449;  
SELECT '643314' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 1017763 AND currency = 'ZAR'

--------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'CZK'

DECLARE @addvalue INT;  
SET @addvalue = 786360;  
SELECT '426109' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 1212469 AND currency = 'CZK'

----------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'NOK'

DECLARE @addvalue INT;  
SET @addvalue = 839900;  
SELECT '185664' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 1025564 AND currency = 'NOK'

--------------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'GBP'

DECLARE @addvalue INT;  
SET @addvalue = 47476;  
SELECT '50545' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 98021 AND currency = 'GBP'

---------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'PHP'

DECLARE @addvalue INT;  
SET @addvalue = 552400;  
SELECT '291710' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 844110 AND currency = 'PHP'

--------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'MXN'

DECLARE @addvalue INT;  
SET @addvalue = 397916;  
SELECT '642075' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 1039991 AND currency = 'MXN'

------------
SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'EUR'

DECLARE @addvalue INT;  
SET @addvalue = 54568;  
SELECT '66008' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 120576 AND currency = 'EUR'

---------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'CAD'

DECLARE @addvalue INT;  
SET @addvalue = 42492;  
SELECT '83518' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 126010 AND currency = 'CAD'

---------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'AUD/NZD'

DECLARE @addvalue INT;  
SET @addvalue = 60526;  
SELECT '106384' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 166910 AND currency = 'AUD/NZD'

-----------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'CHF'

DECLARE @addvalue INT;  
SET @addvalue = 147261;  
SELECT '130613' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 277874 AND currency = 'CHF'

--------------------

SELECT STDEVP(annual_salary) AS STD, AVG(annual_salary) AS AVG
FROM Salary_Survey
WHERE currency = 'SGD'

DECLARE @addvalue INT;  
SET @addvalue = 98173;  
SELECT '48005' + @addvalue 

DELETE FROM Salary_Survey
WHERE annual_salary > 146178 AND currency = 'SGD'


-- I still can see odd numbers, will clean them manually

SELECT annual_salary, currency, job
FROM Salary_Survey
WHERE currency = 'USD'
ORDER BY annual_salary DESC

DELETE FROM Salary_Survey
WHERE annual_salary = 750000 AND job = 'Admin manager' OR
      annual_salary = 657900 AND job = 'Education Technology Manager' OR
	  annual_salary = 645000 AND job = 'Librarian' OR
	  annual_salary = 630000 AND job = 'Engineering Manager' OR
	  annual_salary = 603000 AND job = 'Staff Engineer' OR
	  annual_salary = 590000 AND job = 'Software Engineer' OR
	  annual_salary = 576000 AND job = 'Attorney' OR
	  annual_salary = 575000 AND job = 'Senior Researcher' OR
	  annual_salary = 570000 AND job = 'middle school social studies teacher' OR
	  annual_salary = 560000 AND job = 'Facilities Coordinator ' OR
	  annual_salary = 550000 AND job = 'Senior Manager Software Dev' OR
	  annual_salary = 540000 AND job = 'Campaign Manager' OR
	  annual_salary = 510000 AND job = 'Program Associate' OR
	  annual_salary = 504456 AND job = 'Senior Software Engineer' OR
	  annual_salary = 500000 AND job = 'Librarian' OR
	  annual_salary = 500000 AND job = 'Senior Software Engineer' OR
	  annual_salary = 500000 AND job = 'Turnip farmer' OR
	  annual_salary = 499945 AND job = 'Program Associate' OR
	  annual_salary = 480000 AND job = 'Principal Software Development Engineer' OR
	  annual_salary = 480000 AND job = 'National Sales Coordinator' OR
	  annual_salary = 475000 AND job = 'Senior Software Engineer' OR
	  annual_salary = 470000 AND job = 'Editor in chief' OR
	  annual_salary = 457000 AND job = 'Machine Operator ' OR
	  annual_salary = 450000 AND job = 'Senior Security Engineer' OR
	  annual_salary = 450000 AND job = 'Assistant Underwriter ' OR
	  annual_salary = 432000 AND job = 'High School Math Teacher' OR
	  annual_salary = 425000 AND job = 'Desktop Supporg' OR
	  annual_salary = 400000 AND job = 'attorney' OR
	  annual_salary = 400000 AND job = 'Operations' OR
	  annual_salary = 400000 AND job = 'Managing Principal'


