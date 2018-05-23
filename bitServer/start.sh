#!/bin/bash
source ../chaos.env

CHAOS_SVR_NAME=`cat $CONFIG_FILE | grep "{node" | awk -F"'" '{print $2}'`
echo $CHAOS_SVR_NAME
DUMP_NAME="${CHAOS_SVR_NAME}_"$DUMP_NAME

ERL_PARAM=" +P 300000"
ERL_PARAM+=" -env ERL_MAX_PORTS 100000"
ERL_PARAM+=" +pc unicode" 
ERL_PARAM+=" -pa ./ebin"
ERL_PARAM+=" -pa ${LIB_PATH}"
ERL_PARAM+=" -name ${CHAOS_SVR_NAME}"
ERL_PARAM+=" -setcookie ${COOKIE}"
ERL_PARAM+=" -smp enable"
ERL_PARAM+=" +K true +S 4 +c"
# ERL_PARAM+=" +zdbbl 2048"
ERL_PARAM+=" -detached"

echo "start okex_game_svr ..."
ERL_CRASH_DUMP=${DUMP_DIR} INSTANCE_NAME=${DUMP_NAME} erl -boot start_sasl -config ${LOG_HOME}/log ${ERL_PARAM} -s bitServer_app
