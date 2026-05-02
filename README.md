# Oracle RMAN Production Automation Toolkit

![Oracle](https://img.shields.io/badge/Oracle-19c%20%7C%2021c%20%7C%2023ai-red)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20Unix-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Production-success)
![Author](https://img.shields.io/badge/Author-Jesus%20Bastidas-gold)
![Oracle ACE](https://img.shields.io/badge/Oracle-ACE%20Journey-orange)

Enterprise-grade Oracle RMAN automation toolkit designed for secure, scalable, and production-ready backup and recovery operations.

Developed and validated through real-world enterprise Oracle environments including:

- Oracle Database 19c
- Oracle RAC
- Oracle ASM
- Oracle Data Guard
- Oracle Database Appliance (ODA)
- Oracle Cloud Infrastructure (OCI)

---

## Overview

This repository provides a collection of production-ready RMAN scripts for:

- Full database backups
- Incremental backups
- Tablespace backups
- Datafile backups
- Archivelog lifecycle management
- Point-In-Time Recovery (PITR)
- Dropped table recovery
- Tape restore operations
- RMAN diagnostics
- Backup monitoring
- Block Change Tracking optimization

These scripts are based on Oracle RMAN best practices for automated and secure database protection. :contentReference[oaicite:0]{index=0}

---

## Repository Structure

```bash
oracle-rman-production-toolkit/
│
├── README.md
├── LICENSE
├── docs/
├── screenshots/
├── scripts/
│   ├── full_backup/
│   ├── incremental_backup/
│   ├── tablespace_backup/
│   ├── datafile_backup/
│   ├── archivelog_management/
│   ├── restore_recovery/
│   ├── diagnostics/
│   ├── monitoring/
│   └── optimization/
│
├── examples/
│   ├── single_instance/
│   ├── rac/
│   ├── dataguard/
│   └── oda/
│
└── wrappers/
    ├── shell/
    ├── cron/
    └── logging/
```

---

## Included Modules

### Backup Operations

| Module | Description |
|--------|-------------|
| Full Backup | Complete database backup |
| Incremental Backup | Changed block backup |
| Tablespace Backup | Specific tablespace backup |
| Datafile Backup | Selected datafile backup |

---

### Archivelog Management

| Module | Description |
|--------|-------------|
| Backup Archivelogs | Backup all archive logs |
| Delete Old Archives | Cleanup old archives |
| Backup by Sequence | Backup specific sequences |
| ASM Copy | Copy from ASM to filesystem |

---

### Recovery Operations

| Module | Description |
|--------|-------------|
| Recover Dropped Table | Table recovery |
| Tape Restore | Restore from SBT_TAPE |
| PITR | Point-in-time recovery |

---

### Monitoring and Optimization

| Module | Description |
|--------|-------------|
| RMAN Trace | Diagnostics |
| Backup Progress | Real-time monitoring |
| Block Change Tracking | Incremental optimization |
| Syntax Check | Command validation |

---

## Production Features

✔ Multi-channel backups  
✔ ASM integration  
✔ RAC-ready  
✔ Data Guard ready  
✔ Tape backup support  
✔ Recovery validation  
✔ Performance optimization  
✔ Monitoring scripts  

---

## Tested Environments

### On-Premises

- Oracle Linux
- Red Hat Enterprise Linux
- Oracle Database Appliance

### Cloud

- Oracle Cloud Infrastructure

---

## Real Enterprise Use Cases

### Scenario 1 — Full Backup

```bash
rman target / cmdfile full_backup.rman
```

### Scenario 2 — Dropped Table Recovery

```bash
rman target /
```

Then:

```sql
RECOVER TABLE ...
```

Based on Oracle RMAN recovery procedures. :contentReference[oaicite:1]{index=1}

---

## Roadmap

- [x] Core RMAN scripts
- [ ] Shell automation wrappers
- [ ] HTML reporting
- [ ] Email notifications
- [ ] OCI Object Storage integration
- [ ] Ansible deployment
- [ ] Grafana monitoring

---

## About the Author

Senior Oracle Database Administrator with 20+ years in IT and extensive experience in:

- Oracle RAC
- ASM
- Data Guard
- RMAN
- Performance Tuning
- Exadata
- OCI
- Automation

Currently pursuing Oracle ACE.

---

## Connect

LinkedIn:
(Your LinkedIn URL)

GitHub:
(Your GitHub URL)

---

## License

MIT License
