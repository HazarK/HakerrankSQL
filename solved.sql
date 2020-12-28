--this is a collection of HackerRank SQL challenges
/*
https://www.hackerrank.com/challenges/weather-observation-station-20/problem
*/

SELECT round(avg(LAT_N),4)
from (select LAT_N , row_number() OVER(ORDER BY LAT_N) as row_num, 
count(lat_n) over() as count_lat_n
FROM STATION) a
WHERE ((count_lat_n%2)!=0 AND row_num =(floor(count_lat_n/2)+1)) OR ((count_lat_n%2)=0 AND row_num in (floor(count_lat_n/2)+1,floor(count_lat_n/2)));

/* Option 2 */
SET @N := 0;
SELECT COUNT(*) FROM STATION INTO @TOTAL;
SELECT
    ROUND(AVG(A.LAT_N), 4)
FROM (SELECT @N := @N +1 AS ROW_ID, LAT_N FROM STATION ORDER BY LAT_N) A
WHERE
    CASE WHEN MOD(@TOTAL, 2) = 0 
            THEN A.ROW_ID IN (@TOTAL/2, (@TOTAL/2+1))
            ELSE A.ROW_ID = (@TOTAL+1)/2
    END
;
/*
https://www.hackerrank.com/challenges/weather-observation-station-2/problem?h_r=next-challenge&h_v=zen
*/
SELECT round(sum(LAT_N),2) , round(sum(LONG_W),2)
FROM STATION;


/*
https://www.hackerrank.com/challenges/weather-observation-station-13/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
*/
SELECT round(sum(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;



/*
https://www.hackerrank.com/challenges/weather-observation-station-14/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
*/
SELECT round(max(LAT_N),4)
FROM STATION
WHERE LAT_N < 137.2345;

/* 
https://www.hackerrank.com/challenges/the-pads/problem
The PADS - Medium
*/

Create table temp as 
select CONCAT(name,"(",left(occupation,1),")") as a 
FROM OCCUPATIONS
UNION 
SELECT CONCAT("There are a total of ",occupation_count," ",occ,"s.") as a 
FROM (SELECT distinct lower(occupation) as occ, count(name) OVER(partition by occupation)  as occupation_count FROM OCCUPATIONS) newtable
;
select * from temp order by a;




