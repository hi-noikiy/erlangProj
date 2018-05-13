-module(okex_data_handler).

-behaviour(websocket_client_handler).

-export([
    start_listen/1,
    init/2,
    websocket_handle/3,
    websocket_info/3,
    websocket_terminate/3
]).

start_listen(OkexPidName) ->
    crypto:start(),
    ssl:start(),
    
    %% wss://real.okex.com:10441/websocket
    {ok, Pid} = websocket_client:start_link("wss://real.okex.com:10440/websocket/okexapi", ?MODULE, [OkexPidName]),
    okex_data:insert_okex_pid(OkexPidName, Pid),
    {ok, Pid}.


% start_link() ->
%     crypto:start(),
%     ssl:start(),
%     Pid = websocket_client:start_link("wss://real.okex.com:10441/websocket", ?MODULE, []),
%     put(web_client_pid, Pid),
%     ok.

init([OkexPidName], _ConnState) ->
    io:format("-------init okex : ~p begin------- ~n", [OkexPidName]),
    State = {OkexPidName},
    {ok, State}.

websocket_handle({pong, _}, _ConnState, State) ->
    io:format("----websocket_handle---- ~n"),
    {ok, State};

websocket_handle({text, Msg}, _ConnState, State) ->
    {OkexPidName} = State,
    io:format("----Received ~p Msg ~p ~n", [OkexPidName, Msg]),
    {ok, State}.
    %%{reply, {text, Bin}, State + 1}.

websocket_info(start, _ConnState, State) ->
    io:format("----websocket_info----~n"),
    {reply, {text, <<>>}, State}.

websocket_terminate(Reason, _ConnState, State) ->
    {OkexPidName} = State,
    io:format("Websocket closed of okex: ~p with reason ~p~n", [OkexPidName, Reason]),
    ok.

% test_send() ->
%     io:format("test_send------~n"),
%     JsonL = [
%         {"event", "addChannel"},
%         {"channel", "ok_sub_futureusd_btc_kline_this_week_1min"}
%     ],
%     JsonBody = mochijson:encode({struct, JsonL}),
%     Bin = iolist_to_binary(JsonBody),
%     {ok, Pid} = get(web_client_pid),
%     io:format("Pid--->~p ~n", [Pid]),
%     websocket_client:cast(Pid, {text, Bin}),
%     io:format("test_send-------->~p ~n", [Pid]),
%     ok.
