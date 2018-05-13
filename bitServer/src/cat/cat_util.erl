-module(cat_util).
-export([
	cal_stock_num/5,
	cal_stock_num_g/6
]).

%% 普通
%% 总资金 允许损失总资金幅度 最大跌幅  每股价格
cal_stock_num(MaxMoney, MaxLoseRange, MaxDownRange, MaxUpRange, PerPriceNow) ->

	%% 每次最大损失
	MaxDown = MaxMoney * MaxLoseRange,
	io:format("MaxDown----->~p ~n", [MaxDown]),

	%% 每次最大盈利
	MaxUp = MaxDown * MaxUpRange / MaxDownRange,
	io:format("MaxUp----->~p ~n", [MaxUp]),

	%% 每只股允许跌额度
	PerLoseMax = PerPriceNow * MaxDownRange,

	%% 每只股允许涨额度
	PerWinMax = PerPriceNow * MaxUpRange,

	%% 允许买多少股
	MaxNum = MaxDown / PerLoseMax,

	%% 需要投入金额
	MaxInvest = MaxNum * PerPriceNow,

	%% 止损价格
	StopLosePrice = PerPriceNow - PerLoseMax,

	%% 止盈价格
	StopWinPrice = PerPriceNow + PerWinMax,

	%%投入金额 损失 盈利 买股数 止损价格 止盈价格
 	{MaxInvest, lib_util:floor(MaxDown), lib_util:ceil(MaxUp), lib_util:floor(MaxNum), StopLosePrice, StopWinPrice}.

%% 去杠杆
%% 总资金 允许损失总资金幅度 最大跌幅  每股价格 杠杆倍数
cal_stock_num_g(MaxMoney, MaxLoseRange, MaxDownRange, MaxUpRange, PerPriceNow, Ganggan) ->

	%% 每次最大损失
	MaxDown = MaxMoney * MaxLoseRange,
	io:format("MaxDown----->~p ~n", [MaxDown]),

	%% 每次最大盈利
	MaxUp = MaxDown * MaxUpRange / MaxDownRange,
	io:format("MaxUp----->~p ~n", [MaxUp]),

	%% 每只股允许跌额度
	PerLoseMax = PerPriceNow * MaxDownRange,

	%% 每只股允许涨额度
	PerWinMax = PerPriceNow * MaxUpRange,

	%% 允许买多少股
	MaxNum = MaxDown / (PerLoseMax * Ganggan),

	%% 需要投入金额
	MaxInvest = MaxNum * PerPriceNow,

	%% 止损价格
	StopLosePrice = PerPriceNow - PerLoseMax,

	%% 止盈价格
	StopWinPrice = PerPriceNow + PerWinMax,

	%%需要投入金额 损失 盈利 买股数 止损价格 止盈价格
 	{MaxInvest, lib_util:floor(MaxDown), lib_util:ceil(MaxUp), lib_util:floor(MaxNum), StopLosePrice, StopWinPrice}.