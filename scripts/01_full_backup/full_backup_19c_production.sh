#!/bin/bash
# =============================================================================
# Script Name : full_backup_19c_production.sh
# Description : Enterprise wrapper for Oracle RMAN full database backup
# Author      : Jesus Bastidas
# Version     : 1.0
# =============================================================================

set -u

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

BACKUP_BASE="/u02/backup/rman"
DATE_TAG=$(date '+%Y%m%d_%H%M%S')
BACKUP_DIR="${BACKUP_BASE}/${ORACLE_SID}/full/${DATE_TAG}"
LOG_DIR="${BACKUP_BASE}/${ORACLE_SID}/logs"
LOG_FILE="${LOG_DIR}/full_backup_${ORACLE_SID}_${DATE_TAG}.log"
RMAN_SCRIPT="$(dirname "$0")/full_backup_19c_production.rman"

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

echo "============================================================" | tee -a "$LOG_FILE"
echo "Oracle RMAN Full Backup - Production Wrapper" | tee -a "$LOG_FILE"
echo "Database SID : $ORACLE_SID" | tee -a "$LOG_FILE"
echo "Backup Dir   : $BACKUP_DIR" | tee -a "$LOG_FILE"
echo "Log File     : $LOG_FILE" | tee -a "$LOG_FILE"
echo "Start Time   : $(date)" | tee -a "$LOG_FILE"
echo "============================================================" | tee -a "$LOG_FILE"

if [ ! -x "$ORACLE_HOME/bin/rman" ]; then
    echo "ERROR: RMAN binary not found or not executable." | tee -a "$LOG_FILE"
    exit 1
fi

if [ ! -f "$RMAN_SCRIPT" ]; then
    echo "ERROR: RMAN script not found: $RMAN_SCRIPT" | tee -a "$LOG_FILE"
    exit 1
fi

rman target / cmdfile="$RMAN_SCRIPT" using "$BACKUP_DIR" log="$LOG_FILE"

RMAN_STATUS=$?

echo "============================================================" | tee -a "$LOG_FILE"
echo "End Time     : $(date)" | tee -a "$LOG_FILE"
echo "RMAN Status  : $RMAN_STATUS" | tee -a "$LOG_FILE"
echo "============================================================" | tee -a "$LOG_FILE"

if [ "$RMAN_STATUS" -ne 0 ]; then
    echo "ERROR: RMAN full backup failed. Check log: $LOG_FILE"
    exit "$RMAN_STATUS"
fi

echo "SUCCESS: RMAN full backup completed successfully."
echo "Log file: $LOG_FILE"

exit 0
