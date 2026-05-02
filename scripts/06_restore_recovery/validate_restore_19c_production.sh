#!/bin/bash
# =============================================================================
# Script Name : validate_restore_19c_production.sh
# Description : Oracle RMAN Restore Validation Wrapper
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

set -u

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

DATE_TAG=$(date '+%Y%m%d_%H%M%S')

LOG_DIR="/u02/backup/rman/${ORACLE_SID}/logs"
mkdir -p "$LOG_DIR"

LOG_FILE="${LOG_DIR}/validate_restore_${DATE_TAG}.log"

RMAN_SCRIPT="$(dirname "$0")/validate_restore_19c_production.rman"

rman target / \
cmdfile="$RMAN_SCRIPT" \
log="$LOG_FILE"
