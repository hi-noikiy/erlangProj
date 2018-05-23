-module(okex_data_analyse).

-export([
	handle_data/1
]).

%% 回包数据分析
handle_data(RetJsonBin) ->
	{struct, JsonL} = mochijson:decode(RetJsonBin),
	io:format("JsonL ----- ~p", [JsonL]).
	%case proplists:get_value("ResultCode", JsonL) of