SELECT * FROM prod7.client;
SELECT * FROM prod7.client_detail;
SELECT * FROM prod7.client_oversight;
SELECT * FROM prod7.client_race;
SELECT * FROM prod7.program;
SELECT * FROM prod7.program_client; 
SELECT * FROM prod7.program_client_history; 

-- Before discharging
SELECT * FROM prod7.client WHERE FORM_ID = 'IDF-IHMIL-QAJ4GMFKWMULY';
SELECT * FROM prod7.client_detail WHERE ID = '11159431';
SELECT * FROM prod7.program WHERE PGM_FORM_ID = 'PROGRAM-IHMIL-QAK4HRSURMULX'


---------------------------------------------------------
--Solving first query

WITH combined_enrollments AS (
    SELECT 
        pc.prov_id,
        pc.pgm_id,
        pc.client_id,
        pc.admission_date,
        pc.release_date
    FROM prod7.program_client pc
    
    UNION ALL
    
    SELECT 
        pch.prov_id,
        pch.pgm_id,
        pch.client_id,
        pch.admission_date,
        pch.release_date
    FROM prod7.program_client_history pch
)
SELECT 
    NVL(cd.language_other, TO_CHAR(cd.language)) AS oral_language,
    COUNT(DISTINCT ce.client_id) AS individual_count
FROM combined_enrollments ce
JOIN prod7.program p 
  ON ce.pgm_id = p.id
JOIN prod7.client c 
  ON ce.client_id = c.id
LEFT JOIN prod7.client_detail cd 
  ON c.id = cd.id
WHERE p.name = 'Program-18238'
  AND p.prov_id = 580
  AND ce.admission_date <= TO_DATE('2007-12-31', 'YYYY-MM-DD')
  AND (ce.release_date >= TO_DATE('2007-01-01', 'YYYY-MM-DD') )
GROUP BY NVL(cd.language_other, TO_CHAR(cd.language))
ORDER BY individual_count DESC;

-------------------------------------------------
-- Solving second query







