class VipResultModel {
  List<VipItemModel> records;
  int total;
  int size;
  int current;
  bool searchCount;
  int pages;

  VipResultModel(
      {this.records,
      this.total,
      this.size,
      this.current,
      this.searchCount,
      this.pages});

  VipResultModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = new List<VipItemModel>();
      json['records'].forEach((v) {
        records.add(new VipItemModel.fromJson(v));
      });
    }
    total = json['total'];
    size = json['size'];
    current = json['current'];
    searchCount = json['searchCount'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['size'] = this.size;
    data['current'] = this.current;
    data['searchCount'] = this.searchCount;
    data['pages'] = this.pages;
    return data;
  }
}

class VipItemModel {
  String shareCode;
  String memberId;
  String headImg;
  String mobile;
  Null role;
  int payTime;
  double pendingPurchaseOrderServiceCharge;
  double entryPurchaseOrderServiceCharge;
  String enterpriseName;
  String rejectReason;
  int auditStatus;
  int registerTime;
  bool isShowTodayFlag;

  VipItemModel(
      {this.shareCode,
      this.memberId,
      this.headImg,
      this.mobile,
      this.role,
      this.payTime,
      this.pendingPurchaseOrderServiceCharge,
      this.entryPurchaseOrderServiceCharge,
      this.enterpriseName,
      this.rejectReason,
      this.auditStatus,
      this.registerTime,
      this.isShowTodayFlag});

  VipItemModel.fromJson(Map<String, dynamic> json) {
    shareCode = json['shareCode'];
    memberId = json['memberId'];
    headImg = json['headImg'];
    mobile = json['mobile'];
    role = json['role'];
    payTime = json['payTime'];
    pendingPurchaseOrderServiceCharge =
        json['pendingPurchaseOrderServiceCharge'];
    entryPurchaseOrderServiceCharge = json['entryPurchaseOrderServiceCharge'];
    enterpriseName = json['enterpriseName'];
    rejectReason = json['rejectReason'];
    auditStatus = json['auditStatus'];
    registerTime = json['registerTime'];
    isShowTodayFlag = json['isShowTodayFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shareCode'] = this.shareCode;
    data['memberId'] = this.memberId;
    data['headImg'] = this.headImg;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['payTime'] = this.payTime;
    data['pendingPurchaseOrderServiceCharge'] =
        this.pendingPurchaseOrderServiceCharge;
    data['entryPurchaseOrderServiceCharge'] =
        this.entryPurchaseOrderServiceCharge;
    data['enterpriseName'] = this.enterpriseName;
    data['rejectReason'] = this.rejectReason;
    data['auditStatus'] = this.auditStatus;
    data['registerTime'] = this.registerTime;
    data['isShowTodayFlag'] = this.isShowTodayFlag;
    return data;
  }
}