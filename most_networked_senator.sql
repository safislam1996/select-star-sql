WITH mutuals AS (SELECT 
DISTINCT s1.sponsor_name AS senator,
s2.sponsor_name AS senator_2 
FROM cosponsors s1
JOIN cosponsors s2 ON 
s1.sponsor_name=s2.cosponsor_name 
AND s2.sponsor_name=s1.cosponsor_name 
)
SELECT senator,COUNT(*) AS mutual_count FROM mutuals
GROUP BY senator
ORDER BY mutual_count DESC
LIMIT 1
