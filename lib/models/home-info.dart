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
  bool isExpireCheck;
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
  double todayOriginEstimateMemberServiceFee;
  double thisMonthPendingMemberServiceFee;
  double thisMonthOriginEstimateMemberServiceFee;
  double lastMonthPendingMemberServiceFee;
  double lastMonthOriginEstimateMemberServiceFee;
  double todayPendingGiftPackageServiceFee;
  double thisMonthPendingGiftPackageServiceFee;
  double lastMonthPendingGiftPackageServiceFee;
  bool todayShowOrderFlag;
  bool thisMonthShowOrderFlag;
  bool lastMonthShowOrderFlag;
  bool todayShowMemberFlag;
  bool thisMonthShowMemberFlag;
  bool lastMonthShowMemberFlag;
  bool todayShowAgentFlag;
  bool thisMonthShowAgentFlag;
  bool lastMonthShowAgentFlag;

  HomeInfoModel(
      {this.shareCode,
      this.headSculptureUrl,
      this.nickname,
      this.checkStatus,
      this.checkEndTime,
      this.openedDiamondMemberNum,
      this.checkDiamondMemberNum,
      this.effectiveOrderNum,
      this.checkEffectiveOrderNum,
      this.isExpireCheck,
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
      this.todayOriginEstimateMemberServiceFee,
      this.thisMonthPendingMemberServiceFee,
      this.thisMonthOriginEstimateMemberServiceFee,
      this.lastMonthPendingMemberServiceFee,
      this.lastMonthOriginEstimateMemberServiceFee,
      this.todayPendingGiftPackageServiceFee,
      this.thisMonthPendingGiftPackageServiceFee,
      this.lastMonthPendingGiftPackageServiceFee,
      this.todayShowOrderFlag,
      this.thisMonthShowOrderFlag,
      this.lastMonthShowOrderFlag,
      this.todayShowMemberFlag,
      this.thisMonthShowMemberFlag,
      this.lastMonthShowMemberFlag,
      this.todayShowAgentFlag,
      this.thisMonthShowAgentFlag,
      this.lastMonthShowAgentFlag});

  HomeInfoModel.fromJson(Map<String, dynamic> json) {
    shareCode = json['shareCode'];
    headSculptureUrl = json['headSculptureUrl'];
    nickname = json['nickname'];
    checkStatus = json['checkStatus'];
    checkEndTime = json['checkEndTime'];
    openedDiamondMemberNum = json['openedDiamondMemberNum'];
    checkDiamondMemberNum = json['checkDiamondMemberNum'];
    effectiveOrderNum = json['effectiveOrderNum'];
    checkEffectiveOrderNum = json['checkEffectiveOrderNum'];
    isExpireCheck = json['isExpireCheck'];
    role = json['role'];
    todayIncreasedOrderNum = json['todayIncreasedOrderNum'];
    thisMonthIncreasedOrderNum = json['thisMonthIncreasedOrderNum'];
    lastMonthIncreasedOrderNum = json['lastMonthIncreasedOrderNum'];
    todayIncreasedAppMemberNum = json['todayIncreasedAppMemberNum'];
    thisMonthIncreasedAppMemberNum = json['thisMonthIncreasedAppMemberNum'];
    lastMonthIncreasedAppMemberNum = json['lastMonthIncreasedAppMemberNum'];
    todayIncreasedAgentNum = json['todayIncreasedAgentNum'];
    thisMonthIncreasedAgentNum = json['thisMonthIncreasedAgentNum'];
    lastMonthIncreasedAgentNum = json['lastMonthIncreasedAgentNum'];
    todayPendingPurchaseServiceFee = json['todayPendingPurchaseServiceFee'];
    thisMonthPendingPurchaseServiceFee =
        json['thisMonthPendingPurchaseServiceFee'];
    lastMonthPendingPurchaseServiceFee =
        json['lastMonthPendingPurchaseServiceFee'];
    todayPendingMemberServiceFee = json['todayPendingMemberServiceFee'];
    todayOriginEstimateMemberServiceFee =
        json['todayOriginEstimateMemberServiceFee'];
    thisMonthPendingMemberServiceFee = json['thisMonthPendingMemberServiceFee'];
    thisMonthOriginEstimateMemberServiceFee =
        json['thisMonthOriginEstimateMemberServiceFee'];
    lastMonthPendingMemberServiceFee = json['lastMonthPendingMemberServiceFee'];
    lastMonthOriginEstimateMemberServiceFee =
        json['lastMonthOriginEstimateMemberServiceFee'];
    todayPendingGiftPackageServiceFee =
        json['todayPendingGiftPackageServiceFee'];
    thisMonthPendingGiftPackageServiceFee =
        json['thisMonthPendingGiftPackageServiceFee'];
    lastMonthPendingGiftPackageServiceFee =
        json['lastMonthPendingGiftPackageServiceFee'];
    todayShowOrderFlag = json['todayShowOrderFlag'];
    thisMonthShowOrderFlag = json['thisMonthShowOrderFlag'];
    lastMonthShowOrderFlag = json['lastMonthShowOrderFlag'];
    todayShowMemberFlag = json['todayShowMemberFlag'];
    thisMonthShowMemberFlag = json['thisMonthShowMemberFlag'];
    lastMonthShowMemberFlag = json['lastMonthShowMemberFlag'];
    todayShowAgentFlag = json['todayShowAgentFlag'];
    thisMonthShowAgentFlag = json['thisMonthShowAgentFlag'];
    lastMonthShowAgentFlag = json['lastMonthShowAgentFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shareCode'] = this.shareCode;
    data['headSculptureUrl'] = this.headSculptureUrl;
    data['nickname'] = this.nickname;
    data['checkStatus'] = this.checkStatus;
    data['checkEndTime'] = this.checkEndTime;
    data['openedDiamondMemberNum'] = this.openedDiamondMemberNum;
    data['checkDiamondMemberNum'] = this.checkDiamondMemberNum;
    data['effectiveOrderNum'] = this.effectiveOrderNum;
    data['checkEffectiveOrderNum'] = this.checkEffectiveOrderNum;
    data['isExpireCheck'] = this.isExpireCheck;
    data['role'] = this.role;
    data['todayIncreasedOrderNum'] = this.todayIncreasedOrderNum;
    data['thisMonthIncreasedOrderNum'] = this.thisMonthIncreasedOrderNum;
    data['lastMonthIncreasedOrderNum'] = this.lastMonthIncreasedOrderNum;
    data['todayIncreasedAppMemberNum'] = this.todayIncreasedAppMemberNum;
    data['thisMonthIncreasedAppMemberNum'] =
        this.thisMonthIncreasedAppMemberNum;
    data['lastMonthIncreasedAppMemberNum'] =
        this.lastMonthIncreasedAppMemberNum;
    data['todayIncreasedAgentNum'] = this.todayIncreasedAgentNum;
    data['thisMonthIncreasedAgentNum'] = this.thisMonthIncreasedAgentNum;
    data['lastMonthIncreasedAgentNum'] = this.lastMonthIncreasedAgentNum;
    data['todayPendingPurchaseServiceFee'] =
        this.todayPendingPurchaseServiceFee;
    data['thisMonthPendingPurchaseServiceFee'] =
        this.thisMonthPendingPurchaseServiceFee;
    data['lastMonthPendingPurchaseServiceFee'] =
        this.lastMonthPendingPurchaseServiceFee;
    data['todayPendingMemberServiceFee'] = this.todayPendingMemberServiceFee;
    data['todayOriginEstimateMemberServiceFee'] =
        this.todayOriginEstimateMemberServiceFee;
    data['thisMonthPendingMemberServiceFee'] =
        this.thisMonthPendingMemberServiceFee;
    data['thisMonthOriginEstimateMemberServiceFee'] =
        this.thisMonthOriginEstimateMemberServiceFee;
    data['lastMonthPendingMemberServiceFee'] =
        this.lastMonthPendingMemberServiceFee;
    data['lastMonthOriginEstimateMemberServiceFee'] =
        this.lastMonthOriginEstimateMemberServiceFee;
    data['todayPendingGiftPackageServiceFee'] =
        this.todayPendingGiftPackageServiceFee;
    data['thisMonthPendingGiftPackageServiceFee'] =
        this.thisMonthPendingGiftPackageServiceFee;
    data['lastMonthPendingGiftPackageServiceFee'] =
        this.lastMonthPendingGiftPackageServiceFee;
    data['todayShowOrderFlag'] = this.todayShowOrderFlag;
    data['thisMonthShowOrderFlag'] = this.thisMonthShowOrderFlag;
    data['lastMonthShowOrderFlag'] = this.lastMonthShowOrderFlag;
    data['todayShowMemberFlag'] = this.todayShowMemberFlag;
    data['thisMonthShowMemberFlag'] = this.thisMonthShowMemberFlag;
    data['lastMonthShowMemberFlag'] = this.lastMonthShowMemberFlag;
    data['todayShowAgentFlag'] = this.todayShowAgentFlag;
    data['thisMonthShowAgentFlag'] = this.thisMonthShowAgentFlag;
    data['lastMonthShowAgentFlag'] = this.lastMonthShowAgentFlag;
    return data;
  }
}