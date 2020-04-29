import 'package:agent37_flutter/utils/request.dart';

//  企业营业执照上传
class SystemApi{
  static String systemSettingApi = '/agentSettingApi';

  //  查询系统配置信息
  getSystemSettings() async {
    var r = await service().get('$systemSettingApi/v1/systemSettings');
    return r;
  }

  //  查询公司信息
  getCompanyInfos() async {
    var r = await service().get('$systemSettingApi//v1/companyInfos');
    return r;
  }
}