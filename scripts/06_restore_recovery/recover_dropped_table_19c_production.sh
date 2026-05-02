#!/bin/bash
# =============================================================================
# Script Name : recover_dropped_table_19c_production.sh
# Description : Oracle RMAN Dropped Table Recovery Wrapper
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

set -u

if [ $# -ne 5 ]; then
    echo "Usage:"
    echo "$0 <SCHEMA> <TABLE> <RECOVERY_TIME> <AUX_DEST> <NEW_TABLE>"
    exit 1
fi

SCHEMA_NAME="$1"
TABLE_NAME="$2"
RECOVERY_TIME="$3"
AUX_DEST="$4"
NEW_TABLE="$5"

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

DATE_TAG=$(date '+%Y%m%d_%H%M%S')

LOG_DIR="/u02/backup/rman/${ORACLE_SID}/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="${LOG_DIR}/recover_table_${TABLE_NAME}_${DATE_TAG}.log"

RMAN_SCRIPT="$(dirname "$0")/recover_dropped_table_19c_production.rman"

rman target / \
cmdfile="$RMAN_SCRIPT" \
using \
"$SCHEMA_NAME" \
"$TABLE_NAME" \
"$RECOVERY_TIME" \
"$AUX_DEST" \
"$NEW_TABLE" \
log="$LOG_FILE"
