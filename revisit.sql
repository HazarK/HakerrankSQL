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
FROM (select row_number() OVER() as original_number from information_schema.tables t1, information_schema.tables t2) as o
WHERE o.original_number <= 1000 AND o.original_number > 1
AND NOT EXISTS (
    SELECT * 
    FROM (
        SELECT row_number() OVER() as dividers
        FROM information_schema.tables x1, information_schema.tables x2
    ) tatata
    WHERE original_number%dividers=0 AND dividers<original_number AND dividers>1);

/* Occupations https://www.hackerrank.com/challenges/occupations/problem?h_r=next-challenge&h_v=zen */ 
set @r1=0, @r2=0, @r3=0, @r4=0;
select max(Doctor), max(Professor), max(Singer), max(Actor)
from(
    SELECT
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor,
    case when Occupation='Doctor' then (@r1:=@r1+1)
         when Occupation='Professor' then (@r2:=@r2+1)
         when Occupation='Singer' then (@r3:=@r3+1)
         when Occupation='Actor' then (@r4:=@r4+1) end as row_num
    from OCCUPATIONS
  order by Name
) Temp
group by row_num