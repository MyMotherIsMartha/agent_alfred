class FinanceModel {
  List<FinanceItemModel> records;
  int total;
  int size;
  int current;
  bool searchCount;
  int pages;

  FinanceModel(
      {this.records,
      this.total,
      this.size,
      this.current,
      this.searchCount,
      this.pages});

  FinanceModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = new List<FinanceItemModel>();
      json['records'].forEach((v) {
        records.add(new FinanceItemModel.fromJson(v));
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

class FinanceItemModel {
  String orderNo;
  String orderImageUrl;
  String goodsName;
  String spec;
  double goodsAmount; // 上面的 商品单价
  int quantity;
  String enterpriseName;
  int payTime;
  double totalOrderAmount; // 订单金额
  double commissionFeeRate;
  double commission;
  bool isShowTodayFlag;
  int status;
  int orderType;
  int toRole;
  List<RefundOrders> refundOrders;

  FinanceItemModel(
      {this.orderNo,
      this.orderImageUrl,
      this.goodsName,
      this.spec,
      this.goodsAmount,
      this.quantity,
      this.enterpriseName,
      this.payTime,
      this.totalOrderAmount,
      this.commissionFeeRate,
      this.commission,
      this.isShowTodayFlag,
      this.status,
      this.orderType,
      this.toRole,
      this.refundOrders});

  FinanceItemModel.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'];
    orderImageUrl = json['orderImageUrl'];
    goodsName = json['goodsName'];
    spec = json['spec'];
    goodsAmount = json['goodsAmount'];
    quantity = json['quantity'];
    enterpriseName = json['enterpriseName'];
    payTime = json['payTime'];
    totalOrderAmount = json['totalOrderAmount'];
    commissionFeeRate = json['commissionFeeRate'];
    commission = json['commission'];
    isShowTodayFlag = json['isShowTodayFlag'];
    status = json['status'];
    orderType = json['orderType'];
    if (json['toRole'] != null) {
      toRole = json['toRole'];
    }
    if (json['refundOrders'] != null) {
      refundOrders = new List<RefundOrders>();
      json['refundOrders'].forEach((v) {
        refundOrders.add(new RefundOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderNo'] = this.orderNo;
    data['orderImageUrl'] = this.orderImageUrl;
    data['goodsName'] = this.goodsName;
    data['spec'] = this.spec;
    data['goodsAmount'] = this.goodsAmount;
    data['quantity'] = this.quantity;
    data['enterpriseName'] = this.enterpriseName;
    data['payTime'] = this.payTime;
    data['totalOrderAmount'] = this.totalOrderAmount;
    data['commissionFeeRate'] = this.commissionFeeRate;
    data['commission'] = this.commission;
    data['isShowTodayFlag'] = this.isShowTodayFlag;
    data['status'] = this.status;
    data['orderType'] = this.orderType;
    if (this.toRole != null) {
      data['toRole'] = this.toRole;
    }
    if (this.refundOrders != null) {
      data['refundOrders'] = this.refundOrders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RefundOrders {
  String goodsName;
  String orderImageUrl;
  int quantity;
  double refundAmount;
  String spec;
  int refundOrderTime;
  bool isShowTodayFlag;

  RefundOrders(
      {this.goodsName,
      this.orderImageUrl,
      this.quantity,
      this.refundAmount,
      this.spec,
      this.refundOrderTime,
      this.isShowTodayFlag});

  RefundOrders.fromJson(Map<String, dynamic> json) {
    goodsName = json['goodsName'];
    orderImageUrl = json['orderImageUrl'];
    quantity = json['quantity'];
    refundAmount = json['refundAmount'];
    spec = json['spec'];
    refundOrderTime = json['refundOrderTime'];
    isShowTodayFlag = json['isShowTodayFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsName'] = this.goodsName;
    data['orderImageUrl'] = this.orderImageUrl;
    data['quantity'] = this.quantity;
    data['refundAmount'] = this.refundAmount;
    data['spec'] = this.spec;
    data['refundOrderTime'] = this.refundOrderTime;
    data['isShowTodayFlag'] = this.isShowTodayFlag;
    return data;
  }
}
