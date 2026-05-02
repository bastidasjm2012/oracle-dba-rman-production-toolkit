-- =============================================================================
-- Script Name : check_block_change_tracking_status.sql
-- Description : Oracle Block Change Tracking Status
-- Author      : Jesus Bastidas
-- Version     : 1.0
-- Platform    : Oracle Database 19c / 21c / 23ai
-- =============================================================================

SET LINESIZE 200

COLUMN filename FORMAT A80
COLUMN status FORMAT A20

SELECT
    filename,
    status
FROM v$block_change_tracking;
