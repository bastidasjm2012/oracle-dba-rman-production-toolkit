# Module 06 - Oracle RMAN Restore and Recovery

## Overview

This module provides production-ready Oracle RMAN restore and recovery scripts.

Based on:

- Recover dropped table with RMAN 12c / 19c / 21c.
- Restore archivelogs from RMAN tape.

Additional production enhancements:

- Bash wrappers
- Parameterized execution
- Enterprise logging
- Restore validation
- RAC / ASM / Data Guard considerations

---

## Files

| File | Description |
|---|---|
| recover_dropped_table_19c_production.rman | Recover dropped table |
| recover_dropped_table_19c_production.sh | Bash wrapper |
| restore_archivelog_sequence_19c_production.rman | Restore archivelogs by sequence |
| restore_archivelog_sequence_19c_production.sh | Bash wrapper |
| restore_archivelog_from_tape_19c_production.rman | Restore archivelogs from tape |
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

# Execution

---

## Recover dropped table

Use this script to recover a dropped table to a specific point in time and restore it with a new name.

```bash
./recover_dropped_table_19c_production.sh \
SOLICITUD_SOL \
SOL_DOCUMENTO_ADJUNTO \
"2026-05-01 22:30:00" \
"/u02/aux_rman" \
SOL_DOCUMENTO_ADJUNTO_RECOVERED
```

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `<SCHEMA>` | `SOLICITUD_SOL` | Owner/schema of the dropped table |
| `<TABLE>` | `SOL_DOCUMENTO_ADJUNTO` | Name of the dropped table to recover |
| `<RECOVERY_TIME>` | `"2026-05-01 22:30:00"` | Point in time before the table was dropped |
| `<AUX_DEST>` | `"/u02/aux_rman"` | Auxiliary filesystem location used by RMAN during table recovery |
| `<NEW_TABLE>` | `SOL_DOCUMENTO_ADJUNTO_RECOVERED` | New table name created during recovery |

### What this example does

This command attempts to recover:

```text
SOLICITUD_SOL.SOL_DOCUMENTO_ADJUNTO
```

to the point in time:

```text
2026-05-01 22:30:00
```

using:

```text
/u02/aux_rman
```

and restores it as:

```text
SOLICITUD_SOL.SOL_DOCUMENTO_ADJUNTO_RECOVERED
```

---

## Restore archivelogs by sequence

Use this script to restore a specific sequence range of archivelogs.

```bash
./restore_archivelog_sequence_19c_production.sh \
/u02/restore \
1000 \
1050 \
1
```

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `<DEST>` | `/u02/restore` | Filesystem destination for restored archivelogs |
| `<START_SEQ>` | `1000` | First archive sequence to restore |
| `<END_SEQ>` | `1050` | Last archive sequence to restore |
| `<THREAD>` | `1` | Redo thread number |

### What this example does

Restores archive logs:

```text
Sequence 1000 through 1050
```

from:

```text
Thread 1
```

to:

```text
/u02/restore
```

---

## Restore archivelogs from tape

Use this script to restore archive logs from SBT_TAPE media.

```bash
./restore_archivelog_from_tape_19c_production.sh \
/u02/restore \
7630 \
7640 \
1
```

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `<DEST>` | `/u02/restore` | Filesystem destination |
| `<START_SEQ>` | `7630` | First sequence |
| `<END_SEQ>` | `7640` | Last sequence |
| `<THREAD>` | `1` | Redo thread number |

### What this example does

Restores archive logs:

```text
Sequence 7630 through 7640
```

from:

```text
SBT_TAPE
```

to:

```text
/u02/restore
```

---

## Validate restore

Use this script to validate recoverability without performing an actual restore.

```bash
./validate_restore_19c_production.sh
```

### What this script validates

- Database restore
- Archivelog restore
- Controlfile restore

---

# Output Example

```text
Starting restore...

channel t1: starting archived log restore
channel t1: restoring archived log
channel t1: restore complete

RMAN Status : 0
```

---

# Validation

## List available backups

```rman
LIST BACKUP SUMMARY;
```

## Validate database restore

```rman
RESTORE DATABASE VALIDATE;
```

## Validate archivelog restore

```rman
RESTORE ARCHIVELOG ALL VALIDATE;
```

---

# Production Notes

- Always test recovery procedures in non-production environments.
- Validate backup availability before recovery.
- Ensure the recovery time is before the object was dropped.
- Ensure auxiliary destination has enough free space.
- In RAC environments, verify THREAD number.
- In Data Guard environments, validate archive source.
- In ASM environments, validate ASM accessibility.
- For tape restores, verify media manager configuration.

---

# Source Alignment

This module is based on the original RMAN examples documented in:

- Recover dropped table with RMAN.
- Restore archivelogs from tape.

Additional enterprise enhancements were added for:

- Automation
- Logging
- Validation
- Production readiness
