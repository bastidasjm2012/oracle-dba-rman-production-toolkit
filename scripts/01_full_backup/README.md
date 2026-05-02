# Module 01 - Oracle RMAN Full Database Backup

## Overview

This module provides a production-ready Oracle RMAN full database backup script.

The backup includes:

- Full database backup
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
| `full_backup_19c_production.rman` | RMAN command file |
| `full_backup_19c_production.sh` | Linux Bash wrapper |
| `README.md` | Module documentation |

## Requirements

- Oracle Database 19c or higher
- Linux / Unix environment
- Valid ORACLE_HOME
- Valid ORACLE_SID
- Backup destination with enough free space
- SYSDBA privileges

## Default Variables

Edit the Bash wrapper according to your environment:

```bash
export ORACLE_SID=orahuila

export ORACLE_HOME=/u01/app/odaorahome/oracle/product/19.0.0.0/dbhome_1

BACKUP_BASE=/u02/backup/rman
```

## Execution

Grant execution permission:

```bash
chmod +x full_backup_19c_production.sh
```
## Run backup:
```bash
./full_backup_19c_production.sh

```

## Output Example


/u02/backup/rman/orahuila/full/20260501_221500/
/u02/backup/rman/orahuila/logs/full_backup_orahuila_20260501_221500.log

##  RMAN Features Used


- BACKUP DATABASE
- PLUS ARCHIVELOG
- BACKUP CURRENT CONTROLFILE
- BACKUP SPFILE
- DELETE NOPROMPT OBSOLETE
- COMPRESSED BACKUPSET
- TAG

## Production Notes

Validate the backup regularly using:
```bash
RESTORE DATABASE VALIDATE;

RESTORE ARCHIVELOG ALL VALIDATE;
```
For RAC, ASM, Data Guard, or ODA environments, validate that the backup path is accessible from the node where the database instance is running.
