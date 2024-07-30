#!/system/bin/sh

# Add a marker to indicate the start of the custom log entries
echo "=== Start of log_script.sh entries ===" >> /tmp/recovery.log

# Append dmesg output to recovery log
dmesg >> /tmp/recovery.log

# Append loaded modules to recovery log
lsmod >> /tmp/recovery.log

# Append system properties to recovery log
getprop >> /tmp/recovery.log

# Add a marker to indicate the end of the custom log entries
echo "=== End of log_script.sh entries ===" >> /tmp/recovery.log
