# Module 08 - Oracle RMAN Performance Optimization and Validation

## Overview

This module provides production-ready scripts for RMAN performance optimization and command validation.

Based on:

- Enable Block Change Tracking. :contentReference[oaicite:2]{index=2}
- Check RMAN syntax. :contentReference[oaicite:3]{index=3}

Additional production enhancements:

- Bash wrappers
- Status verification
- Parameterized BCT file placement
- Interactive syntax validation

---

## Files

| File | Description |
|---|---|
| enable_block_change_tracking.sql | Enable block change tracking |
| enable_block_change_tracking.sh | Bash wrapper |
| check_block_change_tracking_status.sql | Check BCT status |
| check_block_change_tracking_status.sh | Bash wrapper |
| syntax_check_backup_database.rman | Validate RMAN syntax |
| syntax_check_backup_database.sh | Bash wrapper |
| interactive_checksyntax.sh | Interactive syntax validation |

---

# Execution

---

## Enable block change tracking

```bash
./enable_block_change_tracking.sh \
/u02/rman/bct/block_change_tracking.log
```

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `<TRACKING_FILE>` | `/u02/rman/bct/block_change_tracking.log` | Physical location of BCT file |

### What this does

Enables:

```text
Block Change Tracking
```

using:

```text
/u02/rman/bct/block_change_tracking.log
```

---

## Check block change tracking status

```bash
./check_block_change_tracking_status.sh
```

Shows:

- Filename
- Status

---

## Validate RMAN syntax

```bash
./syntax_check_backup_database.sh
```

Validates:

```text
BACKUP DATABASE
```

without executing the command.

---

## Interactive syntax validation

```bash
./interactive_checksyntax.sh
```

Then enter:

```rman
RMAN> backup database;
```

---

# Output Example

```text
FILENAME                                              STATUS
----------------------------------------------------  ------
/u02/rman/bct/block_change_tracking.log               ENABLED
```

---

# Production Notes

- Block Change Tracking improves incremental backup performance.
- Place the BCT file on fast storage.
- In RAC, place BCT on shared storage.
- In ASM environments, prefer ASM disk groups.
- Validate syntax before deploying new backup scripts to production.
- Use syntax checks during CI/CD or change windows.
