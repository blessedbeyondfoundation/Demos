#!/bin/bash
if [ "$1" = "" ]; then
  echo "task is required."
  exit 1
fi
DIRECTORY=src/data/providers/tf/$1
if [ ! -d "$DIRECTORY" ]; then
  echo "$DIRECTORY does not exist."
  exit 1
fi
#if [[ "$(whoami)" != root ]]; then
#  echo "Only user root can run this script."
#  exit 1
#fi

clear
cmd=$pwd
scd=$(cd `dirname $0` && pwd)
#`dirname $0`
echo scd=$scd
log=$scd/logs/apply-$(date +%Y-%m-%d-%H-%M).log
echo apply.sh $DIRECTORY,log=$log
#brew tap hashicorp/tap
#brew install hashicorp/tap/terraform
#brew update && brew install azure-cli
#export TF_LOG=TRACE
#export TF_LOG_PATH=log
cd $DIRECTORY
terraform fmt
terraform init
terraform apply -no-color 2>&1 | tee $log

cd $cwd
#powershell
#$Env:TF_LOG = "TRACE"
#terraform apply -no-color 2>&1 | Tee-Object -FilePath apply.log

exit 0