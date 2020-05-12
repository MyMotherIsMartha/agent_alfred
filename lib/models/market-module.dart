class ModuleModel {
  String id;
  String name;
  int moduleType;
  int indexCount;
  List<FindIndexModuleItemVos> itemVos;
  int sequence;
  int total;

  ModuleModel(
      {this.id,
      this.name,
      this.moduleType,
      this.indexCount,
      this.itemVos,
      this.total,
      this.sequence});

  ModuleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    moduleType = json['moduleType'];
    indexCount = json['indexCount'];
    total = json['total'];
    if (json['itemVos'] != null) {
      itemVos = new List<FindIndexModuleItemVos>();
      json['itemVos'].forEach((v) {
        itemVos.add(new FindIndexModuleItemVos.fromJson(v));
      });
    }
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['moduleType'] = this.moduleType;
    data['indexCount'] = this.indexCount;
    data['total'] = this.total;
    if (this.itemVos != null) {
      data['itemVos'] =
          this.itemVos.map((v) => v.toJson()).toList();
    }
    data['sequence'] = this.sequence;
    return data;
  }
}

class FindIndexModuleItemVos {
  int moduleContactType;
  String contactId;
  String contactName;
  String contactImg;
  String tradeName;
  int sequence;

  FindIndexModuleItemVos(
      {this.moduleContactType,
      this.contactId,
      this.contactName,
      this.contactImg,
      this.tradeName,
      this.sequence});

  FindIndexModuleItemVos.fromJson(Map<String, dynamic> json) {
    moduleContactType = json['moduleContactType'];
    contactId = json['contactId'];
    contactName = json['contactName'];
    contactImg = json['contactImg'];
    tradeName = json['tradeName'];
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleContactType'] = this.moduleContactType;
    data['contactId'] = this.contactId;
    data['contactName'] = this.contactName;
    data['contactImg'] = this.contactImg;
    data['tradeName'] = this.tradeName;
    data['sequence'] = this.sequence;
    return data;
  }
}
