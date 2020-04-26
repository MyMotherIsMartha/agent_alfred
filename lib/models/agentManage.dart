class AgentResultModel {
  List<AgentItemModel> records;
  int total;
  int size;
  int current;
  bool searchCount;
  int pages;

  AgentResultModel(
      {this.records,
      this.total,
      this.size,
      this.current,
      this.searchCount,
      this.pages});

  AgentResultModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = new List<AgentItemModel>();
      json['records'].forEach((v) {
        records.add(new AgentItemModel.fromJson(v));
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

class AgentItemModel {
  String headSculptureUrl;
  String enterpriseName;
  String mobile;
  int registerTime;
  int payTime;
  int voucherStatus;
  String voucherRefuseReason;
  int qualificationsStatus;
  String qualificationRefuseReason;
  int checkStatus;
  int settleStatus;

  AgentItemModel(
      {this.headSculptureUrl,
      this.enterpriseName,
      this.mobile,
      this.registerTime,
      this.payTime,
      this.voucherStatus,
      this.voucherRefuseReason,
      this.qualificationsStatus,
      this.qualificationRefuseReason,
      this.checkStatus,
      this.settleStatus});

  AgentItemModel.fromJson(Map<String, dynamic> json) {
    headSculptureUrl = json['headSculptureUrl'];
    enterpriseName = json['enterpriseName'];
    mobile = json['mobile'];
    registerTime = json['registerTime'];
    payTime = json['payTime'];
    voucherStatus = json['voucherStatus'];
    voucherRefuseReason = json['voucherRefuseReason'];
    qualificationsStatus = json['qualificationsStatus'];
    qualificationRefuseReason = json['qualificationRefuseReason'];
    checkStatus = json['checkStatus'];
    settleStatus = json['settleStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headSculptureUrl'] = this.headSculptureUrl;
    data['enterpriseName'] = this.enterpriseName;
    data['mobile'] = this.mobile;
    data['registerTime'] = this.registerTime;
    data['payTime'] = this.payTime;
    data['voucherStatus'] = this.voucherStatus;
    data['voucherRefuseReason'] = this.voucherRefuseReason;
    data['qualificationsStatus'] = this.qualificationsStatus;
    data['qualificationRefuseReason'] = this.qualificationRefuseReason;
    data['checkStatus'] = this.checkStatus;
    data['settleStatus'] = this.settleStatus;
    return data;
  }
}