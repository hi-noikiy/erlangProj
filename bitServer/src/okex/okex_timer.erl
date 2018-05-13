-module(okex_timer).
-export([
		start_heart_beat/1
	]).

-include("okex_api.hrl").

%% 向远端发送心跳包
start_heart_beat(OkexKey) ->
	%% 这里为0,表示永久生效
	lib_timer:add_timer(?HEART_BEAT_INTERVAL, 0, fun()-> heart_beat(OkexKey) end).

%% 发送心跳包
heart_beat(OkexKey) ->
	OkexPid = okex_data:get_okex_pid(OkexKey),
	HeartBody = mochijson:encode({struct, ?HEART_JSON}),
	HeartBin = iolist_to_binary(HeartBody),
	okex_util:okex_send(OkexPid, HeartBin),
	ok.