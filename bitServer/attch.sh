#!/bin/bash
source ../chaos.env

CHAOS_SVR_NAME=`cat $CONFIG_FILE | grep "{node" | awk -F"'" '{print $2}'`
DUMP_NAME="attch_"$DUMP_NAME

ERL_PARAM+=" -pa ./ebin"
ERL_PARAM+=" -pa ${LIB_PATH}"
ERL_PARAM+=" -name attch_${CHAOS_SVR_NAME}"
ERL_PARAM+=" -setcookie ${COOKIE}"
ERL_PARAM+=" +pc unicode"

ERL_CRASH_DUMP=${DUMP_DIR} INSTANCE_NAME=${DUMP_NAME} erl  ${ERL_PARAM} -remsh ${CHAOS_SVR_NAME} 
