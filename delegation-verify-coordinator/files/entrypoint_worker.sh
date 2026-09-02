#!/usr/bin/env bash

# Source credentials for AWS
source /var/mina-delegation-verify-auth/.env

# Per-deployment worker flags, rendered by the chart from
# coordinator.worker.extraEnv. The coordinator builds each worker Job's env from
# a fixed list in server.py, so a variable the worker needs but that list does
# not carry can only reach it from here. Absent or empty when nothing is set.
if [[ -f /bin/entrypoint/worker-env.sh ]]; then
  source /bin/entrypoint/worker-env.sh
fi

/go/bin/submission_updater "$START_TIMESTAMP" "$END_TIMESTAMP"
