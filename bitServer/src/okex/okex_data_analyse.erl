-module(okex_data_analyse).

-export([
	handle_data/1
]).

%% 回包数据分析
handle_data(RetJsonBin) ->
	io:format("RetJsonBin---------recv:~p ~n", [RetJsonBin]),
	{array, JsonList} = mochijson:decode(RetJsonBin),
	Fun = fun(JsonBin) ->
		{struct, JsonL} = JsonBin,
		io:format("JsonL--->~p ~n", [proplists:get_value("channel", JsonL)])
	end,
	lists:foreach(Fun, JsonList).