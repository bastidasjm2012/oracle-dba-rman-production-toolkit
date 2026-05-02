#!/bin/bash
# =============================================================================
# Script Name : interactive_checksyntax.sh
# Description : Oracle RMAN Interactive Syntax Validation
# Author      : Jesus Bastidas
# Version     : 1.0
# Platform    : Oracle Database 19c / 21c / 23ai
# =============================================================================

export ORACLE_SID=${ORACLE_SID:-orahuila}
export ORACLE_HOME=${ORACLE_HOME:-/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1}
export PATH=$ORACLE_HOME/bin:$PATH

rman checksyntax
