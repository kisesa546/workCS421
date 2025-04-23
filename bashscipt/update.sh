#!/usr/bin/bash

file="/var/log/update.log"
repo_dir="/home/ubuntu/app"
log() {
    echo "$(date) - $1"
}

log "Starting updates" >> "$file"
sudo apt update && sudo apt upgrade -y

if [ $? -ne 0 ]; then
    log "Update failed" >> "$file"
    exit 1
else
    log "Updates successful" >> "$file"
fi

log "runnig lastest update ....."

if [ -d "$repo_dir/.git" ]; then
    cd "$repo_dir" || { log "Failed to enter repo directory"; exit 1; }
    if git pull; then
        log "Git pull successful"
    else
        log "Git pull failed"
        exit 1
    fi
else
    log "Git repository not found at $repo_dir"
    exit 1
fi