-module(bit_server).
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-export([start_link/0, start_all_timers/0, stop_all_timers/0]).

start_link() ->
    gen_server:start_link({local,?MODULE}, ?MODULE, [], []).

s_init_mod() ->
    okex_data:mod_init(),
    io:format("okex bt server mod init ok ..."),
    ok.

init(_State) ->
    %log4erl:info("GameSvr start..."),
    process_flag(trap_exit, true), %进程结束后自动调用terminate
    ok = s_init_mod(),
    %log4erl:info("GameSvr start ok"),
    {ok, true}.


terminate(_Reason, Status) ->
    stop_all_timers(),
    
    % guid_db:save_guid_data_for_stop_svr(),
    % actor_db:save_actor_for_stop_svr(),
    % msgbox_db:save_actor_msg_box_for_stop_svr(),

    % log4erl:info("GameSvr stop...[reason]~p~n",[Reason]),
    {ok, Status}.

handle_cast(_R , State) ->
    {noreply, State}.
handle_call(_R , _FROM, State) ->
    {reply, ok, State}.
handle_info(_Reason, State) ->
    {noreply, State}.
code_change(_OldVsn, State, _Extra)->
    {ok, State}.

%%reload用
stop_all_timers() ->
    % actor_db:stop_save_timer(),
    % msgbox_db:stop_save_timer(),
    % guid_db:stop_save_timer(),
    % actor_online:stop_clean_timer(),
    ok.

start_all_timers() ->
    % actor_db:start_save_timer(),
    % msgbox_db:start_save_timer(),
    % guid_db:start_save_timer(),
    % actor_online:start_clean_timer(),
    ok. 