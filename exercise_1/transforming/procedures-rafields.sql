-- Due to a version issue and a spark bug, I can't achieve my desired effect of UNION. I am forced to use UNION ALL.
-- To compensate, I'm making temporary tables with all options then creating my final tables from these intermediary tables.

-- Requires workaround
DROP TABLE procedures_tmp;
CREATE TABLE procedures_tmp
AS
SELECT measure_name, measure_id FROM infections UNION ALL SELECT measure_name, measure_id FROM complications UNION ALL SELECT measure_name, measure_id FROM readmissions UNION ALL SELECT measure_name, measure_id FROM outpatient_imaging ;

DROP TABLE procedures;
CREATE TABLE procedures
AS
SELECT measure_name, measure_id FROM procedures_tmp GROUP BY measure_name, measure_id;
DROP TABLE procedures_tmp;
