-module(okex_util).
-export([
		okex_key_to_api/1,
		okex_key_to_pid_name/1,
		add/1,
		remove/1,
		cal_sign/1,
		okex_send/2
	]).

-define(API_KEY, "8c4d98d0-c157-44db-8177-038f68238bc2").

-define(SECRET_KEY, "CF7C8FA8073F69BC6BA64A8A93CCDCB7").

okex_key_to_api(OkexKey) ->
	if 
		OkexKey == hy_eth_min ->
			"ok_sub_futureusd_eth_kline_this_week_1min";
		OkexKey == hy_btc_min ->
			"ok_sub_futureusd_btc_kline_this_week_1min";
		OkexKey == hy_eth_ticker ->
			"ok_sub_futureusd_eth_ticker_this_week";
		true ->
			"ok_sub_futureusd_ltc_kline_this_week_1min"
	end.

okex_key_to_pid_name(OkexKey) ->
	if 
		OkexKey == hy_eth_min ->
			hy_eth;
		true ->
			hy_eth
	end.

okex_key_to_api_json(OkexKey, AddOrRemove) ->
	Api = okex_key_to_api(OkexKey),
    JsonL = [
        {"event", AddOrRemove},
        {"channel", Api}
    ],
    JsonBody = mochijson:encode({struct, JsonL}),
    Bin = iolist_to_binary(JsonBody),
    Bin.

%% 添加某种监听
add(OkexKey) ->
	PidName = okex_key_to_pid_name(OkexKey),
	case okex_data:get_okex_pid(PidName) of
		null ->
			{ok, ListenPid} = okex_data_handler:start_listen(PidName),
			%% 开始心跳验证
			okex_timer:start_heart_beat(OkexKey),
			%% 发送指令
			Bin = okex_key_to_api_json(OkexKey, "addChannel"),
			okex_send(ListenPid, Bin),
			ok;
		erorr ->
			io:format("okex_add erorr... ~n");
		ListenPid ->
			Bin = okex_key_to_api_json(OkexKey, "addChannel"),
			okex_send(ListenPid, Bin)
	end.

remove(OkexKey) ->
	PidName = okex_key_to_pid_name(OkexKey),
	case okex_data:get_okex_pid(PidName) of
		null ->
			io:format("okex_remove erorr... ~n");
		erorr ->
			io:format("okex_remove erorr... ~n");
		ListenPid ->
			Bin = okex_key_to_api_json(OkexKey, "removeChannel"),
			okex_send(ListenPid, Bin)
	end.

cal_sign(_Key) ->
	ok.


%% 想监听进程发送指令
okex_send(ListenPid, Bin) ->
	websocket_client:cast(ListenPid, {text, Bin}).

