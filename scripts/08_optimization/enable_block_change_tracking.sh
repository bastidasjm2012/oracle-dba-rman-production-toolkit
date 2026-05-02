#!/bin/bash
# =============================================================================
# Script Name : enable_block_change_tracking.sh
# Description : Oracle Block Change Tracking Enablement Wrapper
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

TRACKING_FILE="${1:-/u02/rman/bct/block_change_tracking.log}"

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

sqlplus -s / as sysdba <<EOF
@$(dirname "$0")/enable_block_change_tracking.sql "$TRACKING_FILE"
exit
EOF
