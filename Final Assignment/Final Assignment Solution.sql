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
),
client_x_date AS (
    SELECT 
        ce.client_id,
        c.birth_date,
        MAX(
            CASE 
                WHEN ce.release_date IS NULL THEN TO_DATE('2007-12-31', 'YYYY-MM-DD')
                ELSE LEAST(TO_DATE('2007-12-31', 'YYYY-MM-DD'), ce.release_date)
            END
        ) AS x_date
    FROM combined_enrollments ce
    JOIN prod7.program p 
      ON ce.pgm_id = p.id
    JOIN prod7.client c 
      ON ce.client_id = c.id
    WHERE p.name = 'Program-18238'
      AND p.prov_id = 580
      AND ce.admission_date <= TO_DATE('2007-12-31', 'YYYY-MM-DD')
      AND (ce.release_date >= TO_DATE('2007-01-01', 'YYYY-MM-DD') 
           OR ce.release_date IS NULL)
      AND c.birth_date IS NOT NULL
    GROUP BY ce.client_id, c.birth_date
)
SELECT 
    TRUNC(MONTHS_BETWEEN(x_date, birth_date) / 12) AS calculated_age,
    COUNT(client_id) AS individual_count
FROM client_x_date
GROUP BY TRUNC(MONTHS_BETWEEN(x_date, birth_date) / 12)
ORDER BY calculated_age ASC;






