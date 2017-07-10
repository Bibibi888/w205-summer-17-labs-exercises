-- Due to a version issue and a spark bug, I can't achieve my desired effect of UNION. I am forced to use UNION ALL.
-- To compensate, I'm making temporary tables with all options then creating my final tables from these intermediary tables.

-- No workaround required but a tmp table is required for processing reasons
DROP TABLE procedures_scores_tmp;
CREATE TABLE procedures_scores_tmp
AS
SELECT measure_id, score, hospital AS hospital_name FROM infections UNION ALL SELECT measure_id, score, hospital AS hospital_name FROM complications UNION ALL SELECT measure_id, score, hospital AS hospital_name FROM readmissions UNION ALL SELECT measure_id, score, hospital AS hospital_name FROM outpatient_imaging ;

DROP TABLE procedures_scores;
CREATE TABLE procedures_scores
AS
SELECT measure_id, hospital_name, avg(score) as score FROM procedures_scores_tmp WHERE score IS NOT NULL GROUP BY measure_id, hospital_name;
DROP TABLE procedures_scores_tmp;
