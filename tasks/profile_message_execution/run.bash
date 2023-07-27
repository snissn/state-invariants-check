#!/bin/bash
set -eux
source /mnt/lotus-ec2-tools/.env

INSTANCE_PUBLIC_DNS="$1"
task_name="$2"

mkdir -p /mnt/lotus-ec2-tools/tasks/$task_name/data/

ssh -i  ~/.ssh/aws.pem  ubuntu@$INSTANCE_PUBLIC_DNS bash /mnt/lotus-ec2-tools/tasks/${task_name}/run_task.bash


new_dir="${task_name}-`date +"%Y-%m-%d-%H-%M-%S"`"

new_dir_full=/mnt/lotus-ec2-tools/tasks/${task_name}/data/$new_dir
mkdir -p $new_dir_full

scp -i  ~/.ssh/aws.pem  ubuntu@$INSTANCE_PUBLIC_DNS:profile001.svg $new_dir_full/profile001.svg
scp -i  ~/.ssh/aws.pem  ubuntu@$INSTANCE_PUBLIC_DNS:profile002.svg $new_dir_full/profile002.svg
scp -i  ~/.ssh/aws.pem  ubuntu@$INSTANCE_PUBLIC_DNS:profile001.svg $new_dir_full/ApplyMessage.txt
scp -i  ~/.ssh/aws.pem  ubuntu@$INSTANCE_PUBLIC_DNS:profile002.svg $new_dir_full/RelativePercentages.txt
