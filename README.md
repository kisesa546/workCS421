# workCS421

# 🛠️ Server Maintenance Scripts

This repository contains simple Bash scripts to automate routine maintenance tasks on Ubuntu servers:

- **System Updates**
- **Health Checks**
- **Backups**

---

## 📂 Script Overview

- `update.sh`  
  Updates the package list and upgrades all installed packages.

- `health_check.sh`  
  Displays disk usage, memory status, and running processes.

- `backup.sh`  
  Creates backups of specified files or directories to a chosen location.

---

## 🔐 Making Scripts Executable

Before using the scripts, make them executable by running:

```bash
chmod +x update.sh health_check.sh backup.sh
