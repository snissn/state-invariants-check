#!/bin/bash
set -eux

new_file="check-invariants-`date +"%Y-%m-%d-%H-%M-%S"`.out"
ssh -i  ~/Downloads/mikers-2.pem  ubuntu@$INSTANCE_PUBLIC_DNS bash /mnt/data/state-invariants-check/tasks/state_invariants_check/run_state_invariants_check.bash $new_file
scp -i  ~/Downloads/mikers-2.pem  ubuntu@$INSTANCE_PUBLIC_DNS:/mnt/data/$new_file .
