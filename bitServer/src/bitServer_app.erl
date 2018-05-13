-module(bitServer_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-export([start/0, stop/0, reload/0]).
%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    bitServer_sup:start_link().

stop(_State) ->
    ok.

start() ->
	application:start(bitServer),
	ok.

stop() ->
	application:stop(bitServer),
	ok.

reload() ->
    % log4erl:info("App reload start"),
    %%stop timers
    % stop_all_timers(),
    %%config reload
    %ptauth:reload(),
    %%logic reload
    {ok, [ModuleList]} = file:consult("./proj"),
    lists:foreach(fun(Module) -> lib_sys:reload(Module) end, ModuleList),
    %%start timers
    %start_all_timers(),
    %log4erl:info("App reload finish"),
    ok. 

% stop_all_timers() ->
%     chaos_svr:stop_all_timers(),
%     ok.

% start_all_timers() ->
%     chaos_svr:start_all_timers(),
%     ok. 