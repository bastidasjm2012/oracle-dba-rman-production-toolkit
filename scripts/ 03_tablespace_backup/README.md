# Module 03 - Oracle RMAN Tablespace Backup

## Overview

This module provides a production-ready Oracle RMAN script to back up a specific Oracle tablespace.

The backup includes:

- Tablespace-level backup
- Archivelog backup after tablespace backup
- Current controlfile backup
- Compressed backupsets
- Parallel RMAN channels
- Backup tagging
- Enterprise logging through Bash wrapper

## Files

| File | Description |
|---|---|
| `tablespace_backup_19c_production.rman` | RMAN command file |
| `tablespace_backup_19c_production.sh` | Linux Bash wrapper |
| `README.md` | Module documentation |

## Requirements

- Oracle Database 19c or higher
- Linux / Unix environment
- Valid ORACLE_HOME
- Valid ORACLE_SID
- Existing tablespace
- Backup destination with enough free space
- SYSDBA privileges

## Default Variables

Edit the Bash wrapper according to your environment:

```bash
export ORACLE_SID=orahuila
export ORACLE_HOME=/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1
BACKUP_BASE=/u02/backup/rman
TABLESPACE_NAME=USERS
```

#Execution

Grant execution permission:
```bash
chmod +x tablespace_backup_19c_production.sh
```

Run backup with default tablespace:
```bash
./tablespace_backup_19c_production.sh
```

Run backup for a specific tablespace:
```bash
./tablespace_backup_19c_production.sh DATA_TOBE
```

## Output Example

Backup files:
```bash
/u02/backup/rman/orahuila/tablespace/DATA_TOBE/20260501_224500/
```
Log file:
```bash
/u02/backup/rman/orahuila/logs/tablespace_backup_orahuila_DATA_TOBE_20260501_224500.log
```
Sample execution:
```text
============================================================
Oracle RMAN Tablespace Backup - Production Wrapper
Database SID    : orahuila
Tablespace Name : DATA_TOBE
Backup Dir      : /u02/backup/rman/orahuila/tablespace/DATA_TOBE/20260501_224500
Start Time      : 2026-05-01 22:45:00
============================================================

RMAN backup completed successfully.

============================================================
End Time        : 2026-05-01 22:52:10
RMAN Status     : 0
============================================================
```

## RMAN Features Used
- BACKUP TABLESPACE
- BACKUP ARCHIVELOG ALL
- BACKUP CURRENT CONTROLFILE
- COMPRESSED BACKUPSET
- TAG
- Parallel RMAN channels
- Validation

## Validate the backup with:
```bash
RESTORE TABLESPACE DATA_TOBE VALIDATE;
```
## List tablespace backups:
```bash
LIST BACKUP OF TABLESPACE DATA_TOBE;
```

## Production Notes
Use this module when you need to protect a critical tablespace independently.
Validate that the tablespace exists before execution.
In RAC, ASM, Data Guard, or ODA environments, ensure that the backup destination is accessible from the active instance node.
For read-only tablespaces, consider a specific backup and retention strategy.
