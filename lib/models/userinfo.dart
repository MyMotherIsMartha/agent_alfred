// To parse this JSON data, do
//
//     final userinfoModel = userinfoModelFromJson(jsonString);

import 'dart:convert';

UserinfoModel userinfoModelFromJson(Map data) => UserinfoModel.fromJson(data);

String userinfoModelToJson(UserinfoModel data) => json.encode(data.toJson());

class UserinfoModel {
    String shareCode;
    String parentShareCode;
    String headSculptureUrl;
    String username;
    String nickname;
    String name;
    String mobile;
    int sex;
    String areaCode;
    String occupation;
    String birthDate;
    int type;
    String email;
    int status;
    bool isPrefected;
    bool isOpenPaymentAccount;
    String auditRefuseReason;

    UserinfoModel({
        this.shareCode,
        this.parentShareCode,
        this.headSculptureUrl,
        this.username,
        this.nickname,
        this.name,
        this.mobile,
        this.sex,
        this.areaCode,
        this.occupation,
        this.birthDate,
        this.type,
        this.email,
        this.status,
        this.isPrefected,
        this.isOpenPaymentAccount,
        this.auditRefuseReason,
    });

    factory UserinfoModel.fromJson(Map<String, dynamic> json) => UserinfoModel(
        shareCode: json["shareCode"],
        parentShareCode: json["parentShareCode"],
        headSculptureUrl: json["headSculptureUrl"],
        username: json["username"],
        nickname: json["nickname"],
        name: json["name"],
        mobile: json["mobile"],
        sex: json["sex"],
        areaCode: json["areaCode"],
        occupation: json["occupation"],
        birthDate: json["birthDate"],
        type: json["type"],
        email: json["email"],
        status: json["status"],
        isPrefected: json["isPrefected"],
        isOpenPaymentAccount: json["isOpenPaymentAccount"],
        auditRefuseReason: json["auditRefuseReason"],
    );

    Map<String, dynamic> toJson() => {
        "shareCode": shareCode,
        "parentShareCode": parentShareCode,
        "headSculptureUrl": headSculptureUrl,
        "username": username,
        "nickname": nickname,
        "name": name,
        "mobile": mobile,
        "sex": sex,
        "areaCode": areaCode,
        "occupation": occupation,
        "birthDate": birthDate,
        "type": type,
        "email": email,
        "status": status,
        "isPrefected": isPrefected,
        "isOpenPaymentAccount": isOpenPaymentAccount,
        "auditRefuseReason": auditRefuseReason,
    };
}
