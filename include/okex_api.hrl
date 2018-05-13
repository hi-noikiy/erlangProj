%% okex 合约服务地址
-define(OKEX_HEYUE_ADDR, "wss://real.okex.com:10440/websocket/okexapi").
%% okdex 币币服务地址
-define(OKEX_CCOIN_ADDR, "wss://real.okex.com:10441/websocket").

%% 进程ets
-record(record_okex_pid , {pid_name, pid}).
-define(ETS_OKEX_PID, ets_okex_pid).

%% 心跳间隔 28 秒
-define(HEART_BEAT_INTERVAL, 30 * 1000).

%% 心跳包内容
-define(HEART_JSON, [{"event", "ping"}]).

% CheckRetSign = lib_util:md5_format(integer_to_list(RetAppID)++integer_to_list(?SDK_BAIDU_RET_OK)++RetContent++?SDK_BAIDU_SECRETKEY)