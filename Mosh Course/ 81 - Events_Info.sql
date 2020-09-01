-- EVENTS:
-- A task(or block of SQL code) that gets executed
-- according to a schedule

SHOW VARIABLES; -- show all system variables in mySQL
SHOW VARIABLES LIKE 'event%'; -- only variable which start with 'event'
SET GLOBAL event_scheduler = ON -- turn on
