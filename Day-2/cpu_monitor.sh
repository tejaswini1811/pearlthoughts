#!/bin/bash
# Create a bash script that monitors the CPU usage of the server, and configure Slack Alert. If CPU utilization exceeds the threshold value, send a notification to Slack.
# Set the threshold for CPU usage (in percentage)
THRESHOLD=2

# Slack webhook URL
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"

while true; do
    # Get current CPU usage percentage
    CPU_USAGE=$(top -bn 1 | grep "Cpu(s)" | awk '{print $2 + $4}')

    # Compare with the threshold
    if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
        MESSAGE=":warning: High CPU usage detected - $CPU_USAGE%"

        # Send notification to Slack
        curl -X POST -H "Content-type: application/json" --data "{\"text\":\"$MESSAGE\"}" "$SLACK_WEBHOOK_URL"

        # Sleep for a while to avoid excessive notifications
        sleep 30  # Sleep for 30 seconds
    fi

    # Sleep for a while before checking again
    sleep 20  # Sleep for 20 seconds
done
