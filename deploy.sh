#!/usr/bin/env bash

PLAYBOOK_FILE="playbook.yml"
SOURCE_DIR=$(pwd)
LOG_FILE=$SOURCE_DIR/run.log
EXTRA_ARGS="--syntax-check"

=======================================================================

echo "Starting log" >> $LOG_FILE
echo "Add SSH Key" >> $LOG_FILE
cd ~/.ssh
cat id_rsa >> authorized_keys
LOOPING=$?
echo "DONE..." >> $LOG_FILE

echo "Run Playbook..." >> $LOG_FILE
ansible-playbook  $EXTRA_ARGS $PLAYBOOK_FILE  >> $LOG_FILE
ansible-playbook $PLAYBOOK_FILE -i hosts >> $LOG_FILE
LOOPING=$?

if [ "$LOOPING" -eq 0 ];
then
    echo "Updated!"
else
    echo "Updated failed!!!"
fi 

echo "Ending log" >> $LOG_FILE

exit $LOOPING

=======================================================================
