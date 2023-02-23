-- this query returns the percent change in HPI over the last 5 years, with a baseline year of 1991, also either MAX() or MIN() will work to extract the value

SELECT state,
(MAX(CASE WHEN yr = 2022 AND qtr = 3 THEN index_nsa END) - MAX(CASE WHEN yr = 2017 AND qtr = 1 THEN index_nsa END)) / MAX(CASE WHEN yr = 2017 AND qtr = 1 THEN index_nsa END) * 100 AS pct_change
FROM quarterly_prices
WHERE yr BETWEEN 2017 AND 2022
GROUP BY state
ORDER BY pct_change DESC;