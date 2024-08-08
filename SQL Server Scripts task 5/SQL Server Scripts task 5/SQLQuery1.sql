/*
SQL problems – Part1
Using “World” database, do the following:
*/


-- 1- Display all data for all the countries.
use World
select * from Country


-- 2- Display all the languages you have. (Remove redundant data)

use World
select Language from CountryLanguage --982

select distinct [Language] from CountryLanguage -- 457 rows


--3- Display all countries that lie in Africa sorted Area.

use World
select Name , Continent
from Country
where Continent = 'Africa'


-- 4- Display all cities that have population more than 2 million.

use World
select Name , Population
from City
where Population > 2000000
order by Population asc

-- 5- Display all countries that became independent from 1920 t0 1990

use World
select Name , IndepYear
from Country
where IndepYear between 1920 and 1990
order by IndepYear asc

-- 6- Display all countries that have no independence year.

use World
select Name , IndepYear
from Country
where IndepYear is null

-- 7- Display all countries that have any kind of ‘Republic’ government form.

use World
select Name , GovernmentForm
from Country
where GovernmentForm = 'Republic'

-- 8- Display all countries that lie in Asia and have population more than 100 million.

use World
select Name , Continent , Population
from Country
where Continent = 'Asia' and Population > 100000000
order by Population asc

-- 9- Display country code for all those speak Spanish as an official language.

use World
select CountryCode , Language , IsOfficial
from CountryLanguage
where Language = 'Spanish' and IsOfficial = 1

-- 10- Display country code for all those speak more than 2 languages.

use World
select CountryCode, Language , Count(IsOfficial) 'num'
from CountryLanguage
group by CountryCode, Language

-- 11- Display the number of people on earth.
--Error - Arithmetic overflow error converting expression to data type int.
-- overcome err by convert int to bigint
use World
select SUM(cast(Population as bigint))
from Country

-- BONUS
-- 12- Display all Continents along with the number of countries and total population in each continent.
use World
select continent , count(Name) as 'no. of countries' , sum(cast(Population as bigint) )
from Country
group by  Continent 

--13- You have just discovered a new country, Add it to your database. (Of course, your country have some cities and languages)
use World
insert into Country
values ('ACT', 'HELLO' , 'Africa', 'hi', 25.2 , 1900 , 158291 , 25.5 , 5.5 , 6.5, 'HI' , 'Republic' , 'do' , 52 , 'AC')

-- 14- In your country, increase life expectation by 5 years.
use World
select LifeExpectancy+5  as 'increase life_exp by 5'
from Country
where code = 'ACT'

--15- Try to delete your country, what happens?

use World
delete Country where Code = 'ACT'




