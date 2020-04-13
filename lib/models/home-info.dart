// To parse this JSON data, do
//
//     final homeInfoModel = homeInfoModelFromJson(jsonString);

import 'dart:convert';

HomeInfoModel homeInfoModelFromJson(Map data) => HomeInfoModel.fromJson(data);

String homeInfoModelToJson(HomeInfoModel data) => json.encode(data.toJson());

class HomeInfoModel {
    String shareCode;
    String headSculptureUrl;
    String nickname;
    int checkStatus;
    int checkEndTime;
    int openedDiamondMemberNum;
    int checkDiamondMemberNum;
    int effectiveOrderNum;
    int checkEffectiveOrderNum;
    int role;
    int todayIncreasedOrderNum;
    int thisMonthIncreasedOrderNum;
    int lastMonthIncreasedOrderNum;
    int todayIncreasedAppMemberNum;
    int thisMonthIncreasedAppMemberNum;
    int lastMonthIncreasedAppMemberNum;
    int todayIncreasedAgentNum;
    int thisMonthIncreasedAgentNum;
    int lastMonthIncreasedAgentNum;
    double todayPendingPurchaseServiceFee;
    double thisMonthPendingPurchaseServiceFee;
    double lastMonthPendingPurchaseServiceFee;
    double todayPendingMemberServiceFee;
    double thisMonthPendingMemberServiceFee;
    double lastMonthPendingMemberServiceFee;
    double todayPendingGiftPackageServiceFee;
    double thisMonthPendingGiftPackageServiceFee;
    double lastMonthPendingGiftPackageServiceFee;
    int increasedShowOrderNum;
    int increasedShowMemberNum;
    int increasedShowAgentNum;

    HomeInfoModel({
        this.shareCode,
        this.headSculptureUrl,
        this.nickname,
        this.checkStatus,
        this.checkEndTime,
        this.openedDiamondMemberNum,
        this.checkDiamondMemberNum,
        this.effectiveOrderNum,
        this.checkEffectiveOrderNum,
        this.role,
        this.todayIncreasedOrderNum,
        this.thisMonthIncreasedOrderNum,
        this.lastMonthIncreasedOrderNum,
        this.todayIncreasedAppMemberNum,
        this.thisMonthIncreasedAppMemberNum,
        this.lastMonthIncreasedAppMemberNum,
        this.todayIncreasedAgentNum,
        this.thisMonthIncreasedAgentNum,
        this.lastMonthIncreasedAgentNum,
        this.todayPendingPurchaseServiceFee,
        this.thisMonthPendingPurchaseServiceFee,
        this.lastMonthPendingPurchaseServiceFee,
        this.todayPendingMemberServiceFee,
        this.thisMonthPendingMemberServiceFee,
        this.lastMonthPendingMemberServiceFee,
        this.todayPendingGiftPackageServiceFee,
        this.thisMonthPendingGiftPackageServiceFee,
        this.lastMonthPendingGiftPackageServiceFee,
        this.increasedShowOrderNum,
        this.increasedShowMemberNum,
        this.increasedShowAgentNum,
    });

    factory HomeInfoModel.fromJson(Map<String, dynamic> json) => HomeInfoModel(
        shareCode: json["shareCode"],
        headSculptureUrl: json["headSculptureUrl"],
        nickname: json["nickname"],
        checkStatus: json["checkStatus"],
        checkEndTime: json["checkEndTime"],
        openedDiamondMemberNum: json["openedDiamondMemberNum"],
        checkDiamondMemberNum: json["checkDiamondMemberNum"],
        effectiveOrderNum: json["effectiveOrderNum"],
        checkEffectiveOrderNum: json["checkEffectiveOrderNum"],
        role: json["role"],
        todayIncreasedOrderNum: json["todayIncreasedOrderNum"],
        thisMonthIncreasedOrderNum: json["thisMonthIncreasedOrderNum"],
        lastMonthIncreasedOrderNum: json["lastMonthIncreasedOrderNum"],
        todayIncreasedAppMemberNum: json["todayIncreasedAppMemberNum"],
        thisMonthIncreasedAppMemberNum: json["thisMonthIncreasedAppMemberNum"],
        lastMonthIncreasedAppMemberNum: json["lastMonthIncreasedAppMemberNum"],
        todayIncreasedAgentNum: json["todayIncreasedAgentNum"],
        thisMonthIncreasedAgentNum: json["thisMonthIncreasedAgentNum"],
        lastMonthIncreasedAgentNum: json["lastMonthIncreasedAgentNum"],
        todayPendingPurchaseServiceFee: json["todayPendingPurchaseServiceFee"],
        thisMonthPendingPurchaseServiceFee: json["thisMonthPendingPurchaseServiceFee"],
        lastMonthPendingPurchaseServiceFee: json["lastMonthPendingPurchaseServiceFee"],
        todayPendingMemberServiceFee: json["todayPendingMemberServiceFee"],
        thisMonthPendingMemberServiceFee: json["thisMonthPendingMemberServiceFee"],
        lastMonthPendingMemberServiceFee: json["lastMonthPendingMemberServiceFee"],
        todayPendingGiftPackageServiceFee: json["todayPendingGiftPackageServiceFee"],
        thisMonthPendingGiftPackageServiceFee: json["thisMonthPendingGiftPackageServiceFee"],
        lastMonthPendingGiftPackageServiceFee: json["lastMonthPendingGiftPackageServiceFee"],
        increasedShowOrderNum: json["increasedShowOrderNum"],
        increasedShowMemberNum: json["increasedShowMemberNum"],
        increasedShowAgentNum: json["increasedShowAgentNum"],
    );

    Map<String, dynamic> toJson() => {
        "shareCode": shareCode,
        "headSculptureUrl": headSculptureUrl,
        "nickname": nickname,
        "checkStatus": checkStatus,
        "checkEndTime": checkEndTime,
        "openedDiamondMemberNum": openedDiamondMemberNum,
        "checkDiamondMemberNum": checkDiamondMemberNum,
        "effectiveOrderNum": effectiveOrderNum,
        "checkEffectiveOrderNum": checkEffectiveOrderNum,
        "role": role,
        "todayIncreasedOrderNum": todayIncreasedOrderNum,
        "thisMonthIncreasedOrderNum": thisMonthIncreasedOrderNum,
        "lastMonthIncreasedOrderNum": lastMonthIncreasedOrderNum,
        "todayIncreasedAppMemberNum": todayIncreasedAppMemberNum,
        "thisMonthIncreasedAppMemberNum": thisMonthIncreasedAppMemberNum,
        "lastMonthIncreasedAppMemberNum": lastMonthIncreasedAppMemberNum,
        "todayIncreasedAgentNum": todayIncreasedAgentNum,
        "thisMonthIncreasedAgentNum": thisMonthIncreasedAgentNum,
        "lastMonthIncreasedAgentNum": lastMonthIncreasedAgentNum,
        "todayPendingPurchaseServiceFee": todayPendingPurchaseServiceFee,
        "thisMonthPendingPurchaseServiceFee": thisMonthPendingPurchaseServiceFee,
        "lastMonthPendingPurchaseServiceFee": lastMonthPendingPurchaseServiceFee,
        "todayPendingMemberServiceFee": todayPendingMemberServiceFee,
        "thisMonthPendingMemberServiceFee": thisMonthPendingMemberServiceFee,
        "lastMonthPendingMemberServiceFee": lastMonthPendingMemberServiceFee,
        "todayPendingGiftPackageServiceFee": todayPendingGiftPackageServiceFee,
        "thisMonthPendingGiftPackageServiceFee": thisMonthPendingGiftPackageServiceFee,
        "lastMonthPendingGiftPackageServiceFee": lastMonthPendingGiftPackageServiceFee,
        "increasedShowOrderNum": increasedShowOrderNum,
        "increasedShowMemberNum": increasedShowMemberNum,
        "increasedShowAgentNum": increasedShowAgentNum,
    };
}