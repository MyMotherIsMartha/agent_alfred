class InvoiceInfoModel {
  String checkInvoiceUrl;
  String checkRefuseReason;
  List<InvoiceItems> invoiceItems;
  int invoiceStatus;
  int orderType;
  double serviceCharge;

  InvoiceInfoModel(
      {this.checkInvoiceUrl,
      this.checkRefuseReason,
      this.invoiceItems,
      this.invoiceStatus,
      this.orderType,
      this.serviceCharge});

  InvoiceInfoModel.fromJson(Map<String, dynamic> json) {
    checkInvoiceUrl = json['checkInvoiceUrl']??null;
    checkRefuseReason = json['checkRefuseReason']??'';
    if (json['invoiceItems'] != null) {
      invoiceItems = new List<InvoiceItems>();
      json['invoiceItems'].forEach((v) {
        invoiceItems.add(new InvoiceItems.fromJson(v));
      });
    }
    invoiceStatus = json['invoiceStatus']??'';
    orderType = json['orderType']??'';
    serviceCharge = json['serviceCharge']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkInvoiceUrl'] = this.checkInvoiceUrl;
    data['checkRefuseReason'] = this.checkRefuseReason;
    if (this.invoiceItems != null) {
      data['invoiceItems'] = this.invoiceItems.map((v) => v.toJson()).toList();
    }
    data['invoiceStatus'] = this.invoiceStatus;
    data['orderType'] = this.orderType;
    data['serviceCharge'] = this.serviceCharge;
    return data;
  }
}

class InvoiceItems {
  String invoiceItemContent;
  String invoiceItemName;

  InvoiceItems({this.invoiceItemContent, this.invoiceItemName});

  InvoiceItems.fromJson(Map<String, dynamic> json) {
    invoiceItemContent = json['invoiceItemContent'];
    invoiceItemName = json['invoiceItemName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceItemContent'] = this.invoiceItemContent;
    data['invoiceItemName'] = this.invoiceItemName;
    return data;
  }
}