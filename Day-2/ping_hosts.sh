#!/bin/bash
# Write a bash to ping a list of hosts and report their status.
# List of hosts to ping
HOSTS=("google.com" "directdevops.blog" "orange.in" )

echo "Pinging hosts..."

for host in "${HOSTS[@]}"; do
    if ping -c 1 "$host" &> /dev/null; then
        echo "$host is reachable"
    else
        echo "$host is not reachable"
    fi
done