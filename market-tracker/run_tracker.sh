#!/bin/bash
# Daily Market Catalyst Tracker — run via cron
# Usage: ./run_tracker.sh
# Assumes this script sits in the same folder as CLAUDE.md, next to an /outputs dir.

set -e

# Move into the script's own directory so relative paths (CLAUDE.md, ./outputs) resolve
cd "$(dirname "$0")"

# Make sure the outputs folder exists
mkdir -p outputs

# Timestamp for logging
echo "=== Market Catalyst Tracker run: $(date) ===" >> run_log.txt

# Run Claude Code non-interactively (-p is already headless/print mode), following CLAUDE.md, and log output
claude -p "Follow CLAUDE.md. Run today's market catalyst scan and save the output as instructed." \
  >> run_log.txt 2>&1

echo "=== Run complete: $(date) ===" >> run_log.txt
echo "" >> run_log.txt
