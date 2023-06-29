#!/bin/bash
set -eux

#todo if no task given, provide help message and list tasks
task_name="$1"

INSTANCE_PUBLIC_DNS_FILE=$(mktemp)
./create_spot.bash $INSTANCE_PUBLIC_DNS_FILE

INSTANCE_PUBLIC_DNS="$(cat $INSTANCE_PUBLIC_DNS_FILE)"

bash ./tasks/"$task_name"/run.bash "$INSTANCE_PUBLIC_DNS"

#terminate instance
#./terminate_instance.bash $INSTANCE_ID
