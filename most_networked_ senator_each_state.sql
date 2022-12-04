WITH mutual AS(
SELECT sen_state,senator,COUNT(*) AS common_count   
FROM(
SELECT DISTINCT s1.sponsor_name AS senator,
s1.sponsor_state AS sen_state,
s2.sponsor_name AS senator_2,
s2.sponsor_state AS sen_state_2
FROM cosponsors s1
JOIN cosponsors s2 ON 
s1.sponsor_name=s2.cosponsor_name 
AND s2.sponsor_name=s1.cosponsor_name 
)
GROUP BY senator,sen_state
ORDER BY common_count DESC
 
),

state_max AS 
(
SELECT sen_state,MAX(common_count) AS max_count 
FROM mutual
GROUP BY sen_state
)

SELECT mutual.sen_state,mutual.senator,mutual.common_count
FROM mutual 
JOIN state_max
ON mutual.sen_state=state_max.sen_state
AND mutual.common_count=state_max.max_count

