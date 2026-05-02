-- =============================================================================
-- Script Name : active_rman_sessions.sql
-- Description : Oracle Active RMAN Sessions
-- Author      : Jesus Bastidas
-- Version     : 1.0
-- Platform    : Oracle Database 19c / 21c / 23ai
-- =============================================================================

SET LINESIZE 200

COLUMN username FORMAT A20
COLUMN program FORMAT A40
COLUMN machine FORMAT A25

SELECT
    sid,
    serial#,
    username,
    program,
    machine,
    status
FROM v$session
WHERE program LIKE '%rman%'
ORDER BY sid;
