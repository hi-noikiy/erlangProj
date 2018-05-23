-module(okex_data_analyse).

-export([
	handle_data/1
]).

%% 回包数据分析
handle_data(RetJsonBin) ->
	{array, JsonList} = mochijson:decode(RetJsonBin),
	io:format("JsonList ----- ~p", [JsonList]),
	Fun = fun(JsonBin) ->
		{struct, JsonL} = JsonBin,
		io:format("JsonL--->~p", JsonL)
	end,
	lists:foreach(Fun, JsonList).
	%case proplists:get_value("ResultCode", JsonL) of