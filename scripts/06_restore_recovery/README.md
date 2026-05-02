# Module 06 - Oracle RMAN Restore and Recovery

## Overview

This module provides production-ready Oracle RMAN restore and recovery scripts.

Based on:

- Recover dropped table with RMAN 12c / 19c / 21c. :contentReference[oaicite:2]{index=2}
- Restore archivelogs from RMAN tape. :contentReference[oaicite:3]{index=3}

Additional production enhancements:

- Bash wrappers
- Parameterized execution
- Enterprise logging
- Restore validation

---

## Files

| File | Description |
|---|---|
| recover_dropped_table_19c_production.rman | Recover dropped table |
| recover_dropped_table_19c_production.sh | Bash wrapper |
| restore_archivelog_sequence_19c_production.rman | Restore by sequence |
| restore_archivelog_sequence_19c_production.sh | Bash wrapper |
| restore_archivelog_from_tape_19c_production.rman | Restore from tape |
| restore_archivelog_from_tape_19c_production.sh | Bash wrapper |
| validate_restore_19c_production.rman | Restore validation |
| validate_restore_19c_production.sh | Bash wrapper |

---

## Requirements

- Oracle Database 19c or higher
- Valid RMAN backups
- Valid archivelog backups
- SYSDBA privileges
- Auxiliary destination with enough free space
- Tape integration configured (for SBT_TAPE restores)

---

## Execution

### Recover dropped table

```bash
./recover_dropped_table_19c_production.sh \
SOLICITUD_SOL \
SOL_DOCUMENTO_ADJUNTO \
"2026-05-01 22:30:00" \
"/u02/aux_rman" \
SOL_DOCUMENTO_ADJUNTO_RECOVERED
```

### Restore archivelogs by sequence

```bash
./restore_archivelog_sequence_19c_production.sh \
/u02/restore \
1000 \
1050 \
1
```

### Restore archivelogs from tape

```bash
./restore_archivelog_from_tape_19c_production.sh \
/u02/restore \
7630 \
7640 \
1
```

### Validate restore

```bash
./validate_restore_19c_production.sh
```

---

## Output Example

```text
Starting restore...

channel t1: starting archived log restore
channel t1: restoring archived log
channel t1: restore complete

RMAN Status : 0
```

---

## Validation

List backups:

```rman
LIST BACKUP SUMMARY;
```

Validate restore:

```rman
RESTORE DATABASE VALIDATE;
```

---

## Production Notes

- Always test recovery procedures in non-production environments.
- Validate backup availability before recovery.
- In RAC environments, confirm THREAD number.
- In Data Guard environments, validate the archive source.
- Ensure auxiliary destination has enough free space.
- For tape restores, validate media manager configuration before execution.
