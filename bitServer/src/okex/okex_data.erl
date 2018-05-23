-module(okex_data).
-export([
		mod_init/0,
		get_okex_pid/1,
		insert_okex_pid/2
	]).

-include("okex_api.hrl").

mod_init() ->
	% kline tick data 
	ets:new(?DATA_ETH_KLINE, [{keypos,#record_okex_kline.ts}, named_table, public, set, {write_concurrency,true}]),

	ets:new(?ETS_OKEX_PID, [{keypos,#record_okex_pid.pid_name}, named_table, public, set, {write_concurrency,true}]),
	%

    ok.

get_okex_pid(OkexKey) ->
	PidName = okex_util:okex_key_to_pid_name(OkexKey),
	Data = ets:lookup(?ETS_OKEX_PID, PidName),
	io:format("get_okex_pid -------------------->~p ~n", [Data]),
	case Data of 
		[] ->
			null;
		[Pid_data] ->
			Pid_data#record_okex_pid.pid;
		true ->
			error
	end. 

insert_okex_pid(PidName, OkexPid) ->
	io:format("insert_okex_pid PidName:~p  OkexPid:~p ~n", [PidName, OkexPid]),
	ets:insert(?ETS_OKEX_PID, #record_okex_pid{pid_name = PidName, pid = OkexPid}).
