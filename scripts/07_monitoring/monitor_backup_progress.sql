-- =============================================================================
-- Script Name : monitor_backup_progress.sql
-- Description : Oracle RMAN Backup Progress Monitoring
-- Author      : Jesus Bastidas
-- Version     : 1.0
-- Platform    : Oracle Database 19c / 21c / 23ai
-- =============================================================================

SET LINESIZE 200
SET PAGESIZE 100

COLUMN opname FORMAT A35
COLUMN percent_complete FORMAT 999.99

SELECT
    sid,
    serial#,
    context,
    sofar,
    totalwork,
    ROUND((sofar/totalwork)*100,2) percent_complete,
    opname
FROM v$session_longops
WHERE opname LIKE 'RMAN%'
AND opname NOT LIKE '%aggregate%'
AND totalwork > 0
AND sofar <> totalwork
ORDER BY sid;
