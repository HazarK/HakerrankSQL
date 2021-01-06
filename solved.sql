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

/* https://www.hackerrank.com/challenges/binary-search-tree-1/problem?h_r=next-challenge&h_v=zen Binary Tree nodes */
SELECT distinct main.N, Case when main.p is null then 'Root' 
when par.P is null then 'Leaf' else 'Inner' end as type_of_node
FROM BST as main 
left join BST as par ON (main.N = par.P)
Order by 1;

/* The report https://www.hackerrank.com/challenges/the-report/problem */
SELECT case when g.grade < 8 then NULL else s.name end as Name,
g.grade, s.Marks
FROM Students as s inner join grades as g
ON (s.Marks>=g.min_mark AND s.Marks <= max_mark )
Order by g.grade DESC,
case when g.grade >= 8 then s.name ELSE s.marks end ASC;

/* full score https://www.hackerrank.com/challenges/full-score/problem?h_r=next-challenge&h_v=zen *//
-- My solution
SELECT CONCAT(hacker_id," ",name)
FROM (
    SELECT h.hacker_id, h.name, SUM(case when sub.score = d.score then 1 else 0 end) as full_score
    FROM Hackers as h 
    LEFT JOIN Submissions as sub on (sub.hacker_id = h.hacker_id)
    LEFT JOIN Challenges as ch on (sub.challenge_id = ch.challenge_id)
    LEFT JOIN Difficulty as d on (ch.difficulty_level = d.difficulty_level)
    group by 1,2) a 
WHERE full_score > 1
Order by full_score DESC, hacker_id ASC;

/* harry potter and wands https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?h_r=next-challenge&h_v=zen
*/
-- My solution
SELECT w.id, wp.age, w.coins_needed as min_coins, w.power as power_wands
FROM Wands as w INNER JOIN Wands_property as wp ON (w.code = wp.code)
WHERE is_evil = 0 and w.coins_needed in ( select min(ww.coins_needed)
     FROM Wands as ww INNER JOIN Wands_property as wwp ON (ww.code = wwp.code)
    WHERE wwp.age = wp.age and w.power = ww.power )
ORDER BY w.power DESC, wp.age DESC;


/*
*/

-- My solution
SELECT h.hacker_id, h.name, count(distinct ch.challenge_id) as num_challenges, 
count(distinct ch.challenge_id) OVER(partition by h.hacker_id, h.name) as 
FROM Hackers as h inner join challenges as ch ON (h.hacker_id = ch.hacker_id)
group by count(distinct ch.challenge_id) DESC, h.hacker_id ASC
HAVING 