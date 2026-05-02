#!/bin/bash
# =============================================================================
# Script Name : enable_trace_19c_production.sh
# Description : Oracle RMAN Trace Wrapper
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

TRACE_FILE="${1:-/tmp/rman_trace.out}"

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

rman target / \
cmdfile="$(dirname "$0")/enable_trace_19c_production.rman" \
using "$TRACE_FILE"
