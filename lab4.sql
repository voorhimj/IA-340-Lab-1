--Q4.1
/*no, because we still have VA records in other tables #/

--Q4.2
/*no, because no state has fips of 80*/

--Q4.3
/*it works, but can be better */

--Q4.5
/*yes, it does a good job recognizing the data

--Q4.6
/*SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
WHERE i.year = (SELECT MAX(year) FROM income)
ORDER BY i.income DESC
LIMIT 1;
/*yes it works */

--Q4.7
/*Calculate the VA population growth rate in the past five
years. I told Chat GPT it got it incorrect and it made the adjustments and now it works.*/
WITH recent_pop AS (
    SELECT pop, year
    FROM population
    WHERE fips = '51'
    ORDER BY year DESC
    LIMIT 1
),
past_pop AS (
    SELECT pop, year
    FROM population
    WHERE fips = '51'
    ORDER BY year DESC
    OFFSET 5 LIMIT 1
)
SELECT 
    r.year AS recent_year,
    p.year AS past_year,
    r.pop AS recent_population,
    p.pop AS past_population,
    ((r.pop - p.pop) / p.pop::decimal) * 100 AS growth_rate
FROM recent_pop r, past_pop p; */


--Q4.8
/*Not always, there is the possibility of a miscalculation or interpertation*/
