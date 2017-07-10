SELECT p.measure_name, p.measure_id, std_score 
FROM (SELECT measure_id, std(score) AS std_score FROM procedures_scores WHERE measure_id in ('OP_14', 'COMP_HIP_KNEE', 'MORT_30_CABG', 'OP_11', 'OP_13', 'READM_30_HIP_KNEE', 'MORT_30_COPD', 'OP_9', 'OP_10', 'MORT_30_PN', 'MORT_30_HF', 'READM_30_STK', 'MORT_30_AMI', 'MORT_30_STK', 'READM_30_CABG', 'READM_30_HOSP_WIDE', 'READM_30_PN', 'READM_30_AMI', 'READM_30_COPD', 'READM_30_HF', 'OP_8', 'HAI_1_SIR', 'HAI_6_SIR', 'HAI_5_SIR', 'HAI_4_SIR', 'HAI_3_SIR', 'HAI_2_SIR') GROUP BY measure_id) AS m_rank 
JOIN procedures AS p 
ON p.measure_id = m_rank.measure_id 
ORDER BY std_score;
