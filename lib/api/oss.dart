import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';

//  企业营业执照上传
class OssApi{
  static String serviceAccountApi = '/oss';
  uploadEnterpriseLicense(params) async {
    var r = await service().post('$serviceAccountApi/v1/enterpriseBusinessLicenseRecognitions',
    data: params);
    print(r);
    return r;
  }
  
  uploadFile(data) async {
    return await service().post('$serviceAccountApi/oss/upload', data: data);
  }
}