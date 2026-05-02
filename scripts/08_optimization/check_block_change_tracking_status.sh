#!/bin/bash
# =============================================================================
# Script Name : check_block_change_tracking_status.sh
# Description : Oracle Block Change Tracking Status Wrapper
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

sqlplus -s / as sysdba @"$(dirname "$0")/check_block_change_tracking_status.sql"
