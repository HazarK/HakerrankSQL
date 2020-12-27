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


/* https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?h_r=next-challenge&h_v=zen */


set @N = 21;
select repeat('* ', @N := @N - 1) 
from information_schema.tables;

set @N = 0;
select repeat('* ', @N := @N + 1)
from information_schema.tables
where @N <= 19;

/* Print Prime Numbers https://www.hackerrank.com/challenges/print-prime-numbers/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen*/
SELECT GROUP_CONCAT(original_number SEPARATOR '&')
FROM ( select row_number() OVER() as original_number from information_schema.tables t1,information_schema.tables t2 ) as o
WHERE o.original_number <= 1000 AND o.original_number >1   AND NOT EXISTS(
        SELECT * FROM (
            SELECT row_number() OVER() as dividers FROM
                information_schema.tables t1, information_schema.tables t2
                LIMIT 1000
            ) tatata
        WHERE FLOOR(original_number/dividers)=(original_number/dividers) AND dividers<original_number AND dividers>1);
		
		
		
		SELECT GROUP_CONCAT(original_number SEPARATOR '&')
FROM (select row_number() OVER() as original_number 
      from information_schema.tables t1, information_schema.tables t2 ) as o
WHERE o.original_number <= 1000 AND o.original_number > 1 AND NOT EXISTS(
        SELECT * FROM (
            SELECT row_number() OVER() as dividers
            FROM information_schema.tables t1, information_schema.tables t2
                LIMIT 1000
            ) tatata
        WHERE FLOOR(original_number/dividers)=(original_number/dividers) AND dividers<=original_number AND dividers>1);