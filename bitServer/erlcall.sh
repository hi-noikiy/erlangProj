#!/bin/bash
source ../chaos.env

CHAOS_SVR_NAME=`cat $CONFIG_FILE | grep "{node" | awk -F"'" '{print $2}'`
echo $CHAOS_SVR_NAME

ERL_PARAM=" -name ${CHAOS_SVR_NAME}"
ERL_PARAM+=" -c ${COOKIE}"
ERL_PARAM+=" -r"

#M F A
${ERLCALL} ${ERL_PARAM} -a "$1 $2 $3"
