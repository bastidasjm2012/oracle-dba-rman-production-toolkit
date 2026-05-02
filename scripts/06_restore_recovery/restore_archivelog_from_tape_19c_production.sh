#!/bin/bash
# =============================================================================
# Script Name : restore_archivelog_from_tape_19c_production.sh
# Description : Oracle RMAN Archivelog Restore from Tape Wrapper
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

set -u

if [ $# -ne 4 ]; then
    echo "Usage:"
    echo "$0 <DEST> <START_SEQ> <END_SEQ> <THREAD>"
    exit 1
fi

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

DEST="$1"
START_SEQ="$2"
END_SEQ="$3"
THREAD="$4"

DATE_TAG=$(date '+%Y%m%d_%H%M%S')

LOG_DIR="/u02/backup/rman/${ORACLE_SID}/logs"
mkdir -p "$LOG_DIR"

LOG_FILE="${LOG_DIR}/restore_tape_${DATE_TAG}.log"

RMAN_SCRIPT="$(dirname "$0")/restore_archivelog_from_tape_19c_production.rman"

rman target / \
cmdfile="$RMAN_SCRIPT" \
using "$DEST" "$START_SEQ" "$END_SEQ" "$THREAD" \
log="$LOG_FILE"
