-- Due to a version issue and a spark bug, I can't achieve my desired effect of UNION. I am forced to use UNION ALL.
-- To compensate, I'm making temporary tables with all options then creating my final tables from these intermediary tables.

-- Requires workaround
DROP TABLE hospitals_tmp;
CREATE TABLE hospitals_tmp
AS
SELECT hospital AS hospital_name, state FROM infections UNION ALL SELECT hospital AS hospital_name, state FROM complications UNION ALL SELECT hospital AS hospital_name, state FROM readmissions UNION ALL SELECT hospital AS hospital_name, state FROM outpatient_imaging ;

DROP TABLE hospitals;
CREATE TABLE hospitals
AS
SELECT hospital_name, state FROM hospitals_tmp GROUP BY hospital_name, state;
DROP TABLE hospitals_tmp;
