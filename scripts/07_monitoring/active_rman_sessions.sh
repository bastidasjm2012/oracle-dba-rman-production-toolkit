#!/bin/bash
# =============================================================================
# Script Name : active_rman_sessions.sh
# Description : Oracle Active RMAN Sessions Wrapper
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

sqlplus -s / as sysdba @"$(dirname "$0")/active_rman_sessions.sql"
