# Module 07 - Oracle RMAN Monitoring and Diagnostics

## Overview

This module provides production-ready scripts for monitoring Oracle RMAN operations.

Based on:

- Monitor RMAN backup progress. :contentReference[oaicite:2]{index=2}
- Enable RMAN trace. :contentReference[oaicite:3]{index=3}

Additional enterprise enhancements:

- Bash wrappers
- Active RMAN session monitoring
- Backup inventory review
- Diagnostics collection

---

## Files

| File | Description |
|---|---|
| monitor_backup_progress.sql | Monitor running backups |
| monitor_backup_progress.sh | Bash wrapper |
| list_backup_summary.rman | List backup inventory |
| list_backup_summary.sh | Bash wrapper |
| enable_trace_19c_production.rman | Enable RMAN trace |
| enable_trace_19c_production.sh | Bash wrapper |
| active_rman_sessions.sql | Show active RMAN sessions |
| active_rman_sessions.sh | Bash wrapper |

---

# Execution

---

## Monitor running backup

```bash
./monitor_backup_progress.sh
```

Shows:

- SID
- SERIAL#
- Progress
- Percentage completed

---

## List backup inventory

```bash
./list_backup_summary.sh
```

Shows:

- Backup sets
- Completion time
- Device type
- Tags

---

## Enable RMAN trace

```bash
./enable_trace_19c_production.sh /tmp/rman_trace.out
```

### Parameters

| Parameter | Example | Description |
|---|---|---|
| `<TRACE_FILE>` | `/tmp/rman_trace.out` | Output trace file |

---

## Show active RMAN sessions

```bash
./active_rman_sessions.sh
```

Shows:

- Active sessions
- Machine
- Program
- Status

---

# Output Example

```text
SID SERIAL# PERCENT_COMPLETE OPNAME
--- ------- ---------------- ----------------
211 43122 34.50 RMAN backup
211 43122 72.80 RMAN backup
```

---

# Production Notes

- Use during long-running backups.
- In RAC, run from the active instance node.
- In Data Guard, validate backup source.
- Trace files can be attached to Oracle Support SRs.
