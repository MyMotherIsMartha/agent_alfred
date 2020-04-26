class MarketingSearchModel {
  List<MarketingSearchItemModel> records;
  int total;
  int size;
  int current;
  bool searchCount;
  int pages;

  MarketingSearchModel(
      {this.records,
      this.total,
      this.size,
      this.current,
      this.searchCount,
      this.pages});

  MarketingSearchModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = new List<MarketingSearchItemModel>();
      json['records'].forEach((v) {
        records.add(new MarketingSearchItemModel.fromJson(v));
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

class MarketingSearchItemModel {
  int moduleContactType;
  String contactId;
  String contactName;
  String contactImg;
  String content;
  int createTime;
  String tradeName;

  MarketingSearchItemModel(
      {this.moduleContactType,
      this.contactId,
      this.contactName,
      this.contactImg,
      this.content,
      this.tradeName,
      this.createTime});

  MarketingSearchItemModel.fromJson(Map<String, dynamic> json) {
    moduleContactType = json['moduleContactType'];
    contactId = json['contactId'];
    contactName = json['contactName'];
    contactImg = json['contactImg'];
    content = json['content'];
    tradeName = json['tradeName'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleContactType'] = this.moduleContactType;
    data['contactId'] = this.contactId;
    data['contactName'] = this.contactName;
    data['contactImg'] = this.contactImg;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['tradeName'] = this.tradeName;
    return data;
  }
}
