# Module 05 - Oracle RMAN Archivelog Management

## Overview

This module provides production-ready RMAN scripts for Oracle archivelog lifecycle management.

It includes:

- Backup of all archivelogs
- Backup only archivelogs not backed up before
- Deletion of old archivelogs after backup validation
- Backup by sequence range
- Copy archivelogs from ASM to filesystem
- Controlfile backup after archivelog backup
- Enterprise logging through Bash wrapper

## Files

| File | Description |
|---|---|
| `backup_archivelogs_19c_production.rman` | RMAN archivelog backup command file |
| `backup_archivelogs_19c_production.sh` | Linux Bash wrapper |
| `delete_archivelogs_older_than_1_day.rman` | Deletes archivelogs older than one day after backup |
| `backup_archivelog_sequence_range.rman` | Backs up archivelogs between two sequence numbers |
| `copy_archivelog_from_asm.rman` | Copies archivelog from ASM to filesystem |
| `README.md` | Module documentation |

## Requirements

- Oracle Database 19c or higher
- Database running in ARCHIVELOG mode
- Valid ORACLE_HOME
- Valid ORACLE_SID
- Backup destination with enough free space
- SYSDBA privileges
- ASM access when copying archivelogs from ASM

## Check ARCHIVELOG Mode

```sql
SELECT log_mode
FROM v$database;
```
Expected result:
```sql
ARCHIVELOG
```

## Execution

Grant execution permission:
```sql
chmod +x backup_archivelogs_19c_production.sh
```
Run archivelog backup:
```sql
./backup_archivelogs_19c_production.sh
```

## Output Example

Backup files:
```sql
/u02/backup/rman/orahuila/archivelog/20260501_231500/
```
Log file:
```sql
/u02/backup/rman/orahuila/logs/archivelog_backup_orahuila_20260501_231500.log
```

Sample execution:
```text
============================================================
Oracle RMAN Archivelog Backup - Production Wrapper
Database SID : orahuila
Backup Dir   : /u02/backup/rman/orahuila/archivelog/20260501_231500
Start Time   : 2026-05-01 23:15:00
============================================================

RMAN archivelog backup completed successfully.

============================================================
End Time     : 2026-05-01 23:18:42
RMAN Status  : 0
============================================================
```

## Backup Archivelogs by Sequence Range
```sql
rman target / cmdfile=backup_archivelog_sequence_range.rman \
using "/u02/backup/rman/orahuila/archivelog_sequence" 1000 1050
```

## Copy Archivelog from ASM to Filesystem
```sql
rman target / cmdfile=copy_archivelog_from_asm.rman \
using "+DATA/ORAHUILA/ARCHIVELOG/2026_05_01/thread_1_seq_12345.987.123456789" \
"/u02/dump/thread_1_seq_12345.arc"
```

## Delete Old Archivelogs
```sql
rman target / cmdfile=delete_archivelogs_older_than_1_day.rman
```

## RMAN Features Used
- BACKUP ARCHIVELOG ALL
- NOT BACKED UP 1 TIMES
- DELETE ARCHIVELOG
- BACKUP ARCHIVELOG FROM SEQUENCE
- COPY ARCHIVELOG
- BACKUP CURRENT CONTROLFILE
- COMPRESSED BACKUPSET
- TAG

## Validation

List archivelog backups:
```sql
LIST BACKUP OF ARCHIVELOG ALL;
```

Validate archivelog restore:
```sql
RESTORE ARCHIVELOG FROM SEQUENCE 1000 UNTIL SEQUENCE 1050 VALIDATE;
```

Crosscheck archivelogs:
```sql
CROSSCHECK ARCHIVELOG ALL;
```

## Production Notes
- Never delete archivelogs that have not been backed up.
- In Data Guard environments, validate apply lag before deleting archivelogs.
- In RAC environments, confirm the thread number when restoring or copying archivelogs.
- For ASM environments, use asmcmd or RMAN catalog information to identify the correct archivelog path.
- For ODA environments, ensure that backup destinations are placed on approved mount points with enough free space.
