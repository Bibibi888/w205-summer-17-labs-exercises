SELECT "Correlation: standard deviation and survey score", corr(hs.std_score, sr.avg_rating)

FROM 
(
SELECT hospital_name, std(score) AS std_score  
FROM procedures_scores 
WHERE measure_id in ('OP_14', 'COMP_HIP_KNEE', 'MORT_30_CABG', 'OP_11', 'OP_13', 'READM_30_HIP_KNEE', 'MORT_30_COPD', 'OP_9', 'OP_10', 'MORT_30_PN', 'MORT_30_HF', 'READM_30_STK', 'MORT_30_AMI', 'MORT_30_STK', 'READM_30_CABG', 'READM_30_HOSP_WIDE', 'READM_30_PN', 'READM_30_AMI', 'READM_30_COPD', 'READM_30_HF', 'OP_8', 'HAI_1_SIR', 'HAI_6_SIR', 'HAI_5_SIR', 'HAI_4_SIR', 'HAI_3_SIR', 'HAI_2_SIR') AND score IS NOT NULL AND score > 0 
GROUP BY hospital_name 
) as hs 

JOIN 
(SELECT hospital_name, avg(rating) as avg_rating, count(*) FROM survey_responses WHERE rating > 0 GROUP BY hospital_name) as sr 
ON hs.hospital_name = sr.hospital_name;
