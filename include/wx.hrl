-define(WX_OSS_APPID, "20004").
-define(WX_OSS_APPKEY, "31146e36ffd23f97dc7375e98b7be698").
-define(WX_OK_CODE, "0000").
% -define(V5GOSSURL, "http://v5goss.v5game.cn/game/data_service/process").
-define(V5GOSSURL, "").
-define(V5GOSSURL_TIMEOUT, 3000).

% ----------商场消费点ID说明------------------------------
% 三种代币 钻石 金币 星玉
-define(WX_OSS_PID_COIN_BUY, 1001).% 1001   购买金币    否  钻石
-define(WX_OSS_PID_STA_BUY, 1002).% 1002    购买体力    是  钻石
-define(WX_OSS_PID_PVP_STA_BUY, 1003).% 1003    购买精力   是  钻石
-define(WX_OSS_PID_TAVERN_ADVANCE, 1004).% 1004    顶级征召  是  钻石
-define(WX_OSS_PID_CHAP_STA_RESET, 1005).% 1005    重置关卡 否  钻石
-define(WX_OSS_PID_TOWER_RESET, 1006).% 1006    花费钻石重置命运之塔  否  钻石
-define(WX_OSS_PID_RELIC_POLISH, 1007).% 1007    花费钻石圣物高级洗炼 否  钻石
-define(WX_OSS_PID_RAID_SAFETIME_BUY, 1008).% 1008    夺宝增加免战时间 否  钻石
-define(WX_OSS_PID_RELIC_SET, 1009).% 1009    圣物立即解绑 否  钻石
-define(WX_OSS_PID_ARES_CNT_BUY, 1010).% 1010    战场购买挑战次数 否  钻石
-define(WX_OSS_PID_HERO_DEG, 1011).% 1011    熔炉重置英雄  否  钻石
-define(WX_OSS_PID_EQUIP_DEG, 1012).% 1012    熔炉重置装备 否  钻石
-define(WX_OSS_PID_RELIC_DEG, 1013).% 1013    熔炉重置圣物 否  钻石
-define(WX_OSS_PID_VIP_GIFT_BUY, 1014).% 1014    vip购买超值礼包 否   钻石
-define(WX_OSS_PID_SKILLPOINT_BUY, 1015).% 1015    购买技能点   否   钻石
-define(WX_OSS_PID_SKILL_LEVELUP, 1016).% 1016    技能升级    否   金币
-define(WX_OSS_PID_ACT_DISCOUNT_MART, 1017).% 1017    限时抢购活动购买    是   钻石
-define(WX_OSS_PID_MKT_BLACK_EQUIP_REFRESH, 1018).% 1018   金币商店 刷新 否  钻石
-define(WX_OSS_PID_MKT_MYSTERY_REFRESH, 1019).% 1019    旅行商人刷新 否  钻石
-define(WX_OSS_PID_MKT_MALL_BUY, 1020).% 1020    商城购买商品（总）   否   钻石
-define(WX_OSS_PID_MKT_MYSTERY_BUY, 1021).% 1021    旅行商人购买商品（总） 否   钻石
-define(WX_OSS_PID_MKT_BLACK_BUY, 1022).% 1022    晶玉购买商品（总）  否   星玉
-define(WX_OSS_PID_MKT_BLACK_EQUIP_BUY, 1023).% 1023    金币商店购买商品（总） 否   金币
-define(WX_OSS_PID_EQUIP_LEVELUP, 1024).% 1024    装备强化    否   金币
-define(WX_OSS_PID_RELIC_POLISH_NORMAL, 1025).% 1025    圣物普通铭刻  否   金币
-define(WX_OSS_PID_FAMILY_DONATE_COIN, 1026).% 1026    公会普通捐献  否   金币
-define(WX_OSS_PID_FAMILY_DONATE_DIAMOND, 1027).% 1027    公会钻石捐献  否   钻石
-define(WX_OSS_PID_FAMILY_DONATE_ADVANCE, 1028).% 1028    公会顶级捐献  否   钻石
-define(WX_OSS_PID_FAMILY_WORSHIP, 1029).% 1029    公会钻石祈愿  否   钻石
-define(WX_OSS_PID_NEW_ACTIVITY_COST, 1030).%1030  灵活配置活动消费
-define(WX_OSS_PID_TAVERN_LEGEND, 1031).% 1030    传奇征召  是  钻石

