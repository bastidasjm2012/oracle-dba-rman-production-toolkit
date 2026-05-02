# Module 02 - Oracle RMAN Incremental Backup

## Overview

This module provides a production-ready Oracle RMAN incremental backup script.

The backup includes:

- Incremental Level 1 database backup
- Archivelog backup
- Current controlfile backup
- SPFILE backup
- Compressed backupsets
- Parallel RMAN channels
- Backup tagging
- Obsolete backup cleanup
- Enterprise logging through Bash wrapper

## Files

| File | Description |
|---|---|
| `incremental_backup_19c_production.rman` | RMAN command file |
| `incremental_backup_19c_production.sh` | Linux Bash wrapper |
| `README.md` | Module documentation |

## Requirements

- Oracle Database 19c or higher
- Linux / Unix environment
- Valid ORACLE_HOME
- Valid ORACLE_SID
- Backup destination with enough free space
- SYSDBA privileges

## Default Variables

```bash
export ORACLE_SID=orahuila
export ORACLE_HOME=/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1
BACKUP_BASE=/u02/backup/rman
```

## Execution

Grant execution permission:

```bash
chmod +x incremental_backup_19c_production.sh
```

## Run backup:

```bash
./incremental_backup_19c_production.sh
```

## Output Example

Backup files:

```bash
/u02/backup/rman/orahuila/incremental/20260501_223000/
```

Log file:

```bash
/u02/backup/rman/orahuila/logs/incremental_backup_orahuila_20260501_223000.log
```

Sample execution:

```text
============================================================
Oracle RMAN Incremental Backup - Production Wrapper
Database SID : orahuila
Backup Dir   : /u02/backup/rman/orahuila/incremental/20260501_223000
Start Time   : 2026-05-01 22:30:00
============================================================

RMAN backup completed successfully.

============================================================
End Time     : 2026-05-01 22:42:18
RMAN Status  : 0
============================================================
```
