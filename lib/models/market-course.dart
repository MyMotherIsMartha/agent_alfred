class CourseModel {
  String courseId;
  String courseName;
  String courseImg;
  String tradeId;
  String tradeName;
  int courseStatus;
  int courseSource;
  String updateUserName;
  int createTime;
  List<ContactVos> contactVos;

  CourseModel(
      {this.courseId,
      this.courseName,
      this.courseImg,
      this.tradeId,
      this.tradeName,
      this.courseStatus,
      this.courseSource,
      this.updateUserName,
      this.createTime,
      this.contactVos});

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    courseName = json['courseName'];
    courseImg = json['courseImg'];
    tradeId = json['tradeId'];
    tradeName = json['tradeName'];
    courseStatus = json['courseStatus'];
    courseSource = json['courseSource'];
    updateUserName = json['updateUserName'];
    createTime = json['createTime'];
    if (json['contactVos'] != null) {
      contactVos = new List<ContactVos>();
      json['contactVos'].forEach((v) {
        contactVos.add(new ContactVos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['courseName'] = this.courseName;
    data['courseImg'] = this.courseImg;
    data['tradeId'] = this.tradeId;
    data['tradeName'] = this.tradeName;
    data['courseStatus'] = this.courseStatus;
    data['courseSource'] = this.courseSource;
    data['updateUserName'] = this.updateUserName;
    data['createTime'] = this.createTime;
    if (this.contactVos != null) {
      data['contactVos'] = this.contactVos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactVos {
  String courseId;
  int contactType;
  String imgName;
  int contactSource;
  String contactId;
  String linkUrl;
  String videoName;
  String tutorId;
  String tutorName;
  String tutorDesc;
  String contactContent;
  String tutorImg;
  int isDefault;

  ContactVos(
      {this.courseId,
      this.contactType,
      this.imgName,
      this.contactSource,
      this.contactId,
      this.linkUrl,
      this.videoName,
      this.tutorId,
      this.tutorName,
      this.tutorImg,
      this.tutorDesc,
      this.contactContent,
      this.isDefault});

  ContactVos.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    contactType = json['contactType'];
    imgName = json['imgName'];
    contactSource = json['contactSource'];
    contactId = json['contactId'];
    linkUrl = json['linkUrl'];
    videoName = json['videoName'];
    tutorId = json['tutorId'];
    tutorName = json['tutorName'];
    tutorDesc = json['tutorDesc'];
    tutorImg = json['tutorImg'];
    contactContent = json['contactContent'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['contactType'] = this.contactType;
    data['imgName'] = this.imgName;
    data['contactSource'] = this.contactSource;
    data['contactId'] = this.contactId;
    data['linkUrl'] = this.linkUrl;
    data['videoName'] = this.videoName;
    data['tutorId'] = this.tutorId;
    data['tutorName'] = this.tutorName;
    data['tutorDesc'] = this.tutorDesc;
    data['tutorImg'] = this.tutorImg;
    data['contactContent'] = this.contactContent;
    data['isDefault'] = this.isDefault;
    return data;
  }
}
