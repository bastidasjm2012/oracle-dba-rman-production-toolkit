-- =============================================================================
-- Script Name : enable_block_change_tracking.sql
-- Description : Oracle Block Change Tracking Enablement
-- Author      : Jesus Bastidas
-- Version     : 1.0
-- Platform    : Oracle Database 19c / 21c / 23ai
-- =============================================================================

ALTER DATABASE
ENABLE BLOCK CHANGE TRACKING
USING FILE '&1';
