# workCS421

# 🛠️ Server Maintenance Scripts

This repository contains simple Bash scripts to automate routine maintenance tasks on Ubuntu servers:

-  System Updates 
-  Health Checks 
-  Backups 

---

## 📂 Script Overview

- `update.sh`  
  Updates the package list and upgrades all installed packages.

- `health_check.sh`  
  Displays disk usage, memory status, and running processes.

- `backup.sh`  
  Creates backups of specified files or directories to a chosen location.

---
## types of backup
Sure! Here's a cleaner, simpler, and more polished version of your backup types — perfect for documentation, blog posts, or readme files:

---

## 🔄 Types of Backups

### 1.  Full Backup   
-  What it does:  Copies everything you select — all files and data.  
-  Pros:  Easy to restore; everything is in one place.  
-  Cons:  Slower to create and uses the most storage.

---

### 2.  Incremental Backup   
-  What it does:  Saves only the changes made since the last backup (whether full or incremental).  
-  Pros:  Fast and efficient; uses minimal storage.  
-  Cons:  Restoring takes longer — you need the last full backup *and* all following incrementals.

---

### 3.  Differential Backup   
-  What it does:  Saves changes since the last full backup (ignores previous differentials).  
-  Pros:  Faster to restore than incremental — you only need the last full and latest differential.  
-  Cons:  Uses more space than incremental, especially over time.

---

### 4.  Mirror Backup   
-  What it does:  Creates a real-time, exact copy of your files — no compression or changes.  
-  Pros:  Always matches your current data.  
-  Cons:  If you delete or corrupt a file, it also disappears from the backup.

---

### 5.  Cloud Backup   
-  What it does:  Stores your backups online using cloud storage services.  
-  Pros:  Accessible from anywhere; great for disaster recovery.  
-  Cons:  Requires internet and may involve ongoing costs.


## 🔐 Making Scripts Executable

Before using the scripts, make them executable by running:

```bash
chmod +x update.sh health_check.sh backup.sh

