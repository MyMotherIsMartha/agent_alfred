class ModuleModel {
  String moduleId;
  String moduleName;
  int moduleType;
  int indexCount;
  List<FindIndexModuleItemVos> findIndexModuleItemVos;
  int sequence;

  ModuleModel(
      {this.moduleId,
      this.moduleName,
      this.moduleType,
      this.indexCount,
      this.findIndexModuleItemVos,
      this.sequence});

  ModuleModel.fromJson(Map<String, dynamic> json) {
    moduleId = json['moduleId'];
    moduleName = json['moduleName'];
    moduleType = json['moduleType'];
    indexCount = json['indexCount'];
    if (json['findIndexModuleItemVos'] != null) {
      findIndexModuleItemVos = new List<FindIndexModuleItemVos>();
      json['findIndexModuleItemVos'].forEach((v) {
        findIndexModuleItemVos.add(new FindIndexModuleItemVos.fromJson(v));
      });
    }
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleId'] = this.moduleId;
    data['moduleName'] = this.moduleName;
    data['moduleType'] = this.moduleType;
    data['indexCount'] = this.indexCount;
    if (this.findIndexModuleItemVos != null) {
      data['findIndexModuleItemVos'] =
          this.findIndexModuleItemVos.map((v) => v.toJson()).toList();
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
