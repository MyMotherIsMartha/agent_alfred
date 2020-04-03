import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';

//  企业营业执照上传
class DicApi{
  static String serviceAccountApi = '/dic';
  getOccupations() async {
    var r = await service().get('$serviceAccountApi/v1/occupations');
    print(r);
    return r;
  }
}