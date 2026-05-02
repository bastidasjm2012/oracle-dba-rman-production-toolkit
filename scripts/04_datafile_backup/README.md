# Module 04 - Oracle RMAN Datafile Backup

## Overview

This module provides a production-ready Oracle RMAN script to back up a specific Oracle datafile.

The backup includes:

- Datafile-level backup
- Archivelog backup after datafile backup
- Current controlfile backup
- Compressed backupsets
- Parallel RMAN channels
- Backup tagging
- Enterprise logging through Bash wrapper

## Files

| File | Description |
|---|---|
| `datafile_backup_19c_production.rman` | RMAN command file |
| `datafile_backup_19c_production.sh` | Linux Bash wrapper |
| `README.md` | Module documentation |

## Requirements

- Oracle Database 19c or higher
- Linux / Unix environment
- Valid ORACLE_HOME
- Valid ORACLE_SID
- Existing datafile ID
- Backup destination with enough free space
- SYSDBA privileges

## Default Variables

Edit the Bash wrapper according to your environment:

```bash
export ORACLE_SID=orahuila
export ORACLE_HOME=/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1
BACKUP_BASE=/u02/backup/rman
DATAFILE_ID=1
```
## How to Identify Datafile IDs
```bash
SELECT file_id,
       file_name,
       tablespace_name,
       bytes/1024/1024 AS size_mb
FROM dba_data_files
ORDER BY file_id;
```
## Execution

Grant execution permission:

```bash
chmod +x datafile_backup_19c_production.sh
```

Run backup with default datafile ID:
```bash
./datafile_backup_19c_production.sh
```

Run backup for a specific datafile ID:
```bash
./datafile_backup_19c_production.sh 7
```
## Output Example

Backup files:
```bash
/u02/backup/rman/orahuila/datafile/datafile_7/20260501_225500/
```

Log file:
```bash
/u02/backup/rman/orahuila/logs/datafile_backup_orahuila_df7_20260501_225500.log
```

Sample execution:
```text
============================================================
Oracle RMAN Datafile Backup - Production Wrapper
Database SID : orahuila
Datafile ID  : 7
Backup Dir   : /u02/backup/rman/orahuila/datafile/datafile_7/20260501_225500
Start Time   : 2026-05-01 22:55:00
============================================================

RMAN backup completed successfully.

============================================================
End Time     : 2026-05-01 23:00:36
RMAN Status  : 0
============================================================
```

## RMAN Features Used

- BACKUP DATAFILE
- BACKUP ARCHIVELOG ALL
- BACKUP CURRENT CONTROLFILE
- COMPRESSED BACKUPSET
- TAG
- Parallel RMAN channels
- Validation

## Validate the datafile backup with:
```bash
RESTORE DATAFILE 7 VALIDATE;
```

## List datafile backups:
```bash
LIST BACKUP OF DATAFILE 7;
```

## Production Notes
Use this module when a critical datafile requires an individual backup.
Prefer using the datafile ID instead of absolute file paths for portability.
For ASM environments, datafile IDs are safer than using physical ASM file names directly.
In RAC, ASM, Data Guard, or ODA environments, ensure that the backup destination is accessible from the active instance node.


