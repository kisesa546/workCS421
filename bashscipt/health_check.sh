#!/bin/bash

LOG_FILE="/var/log/server_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
WARNING_FLAG=0

touch $LOG_FILE

log_message() {
    echo "$TIMESTAMP - $1" >> $LOG_FILE
}

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
log_message "CPU Usage: $CPU_USAGE%"

MEMORY_USAGE=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')
log_message "Memory Usage: $MEMORY_USAGE%"

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
log_message "Disk Usage: $DISK_USAGE%"
if [ "$DISK_USAGE" -ge 90 ]; then
    log_message "WARNING: Disk space usage above 90%."
    WARNING_FLAG=1
fi

if pgrep apache2 > /dev/null; then
    log_message "Web Server: Apache is running."
elif pgrep nginx > /dev/null; then
    log_message "Web Server: Nginx is running."
else
    log_message "WARNING: Web server is not running."
    WARNING_FLAG=1
fi

ENDPOINTS=("students" "subjects")
BASE_URL="http://16.171.162.89"

for endpoint in "${ENDPOINTS[@]}"; do
    STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/$endpoint")
    if [ "$STATUS_CODE" -eq 200 ]; then
        log_message "API Check: /$endpoint returned 200 OK."
    else
        log_message "WARNING: /$endpoint returned status $STATUS_CODE."
        WARNING_FLAG=1
    fi
done

log_message "Health check complete.d"
echo "----------------------------------------" >> $LOG_FILE

exit $WARNING_FLAG

