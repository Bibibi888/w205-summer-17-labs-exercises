-- Due to a version issue and a spark bug, I can't achieve my desired effect of UNION. I am forced to use UNION ALL.
-- To compensate, I'm making temporary tables with all options then creating my final tables from these intermediary tables.

-- No workaround required
DROP TABLE survey_responses;
CREATE TABLE survey_responses
AS
SELECT hospital AS hospital_name, measure_id, rating, answer_perc FROM survey;
