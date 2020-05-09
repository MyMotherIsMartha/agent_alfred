import 'package:agent37_flutter/utils/request.dart';

// import 'package:agent37_flutter/utils/req.dart';

//  营销管理
class MarketingApi {
  static String agentMarketingApi = '/agentMarketingApi';

  // banner 列表
  bannerList() async {
    return await service()
        .post('$agentMarketingApi/v1/api/banner/findIndexBannerItemList');
  }

  // 模板 列表
  moduleList() async {
    return await service()
        .post('$agentMarketingApi/v1/api/module/findIndexModuleList');
  }

  // 搜索
  searchModule(String searchKey, int pageNo) async {
    return await service().post(
        '$agentMarketingApi/v1/api/module/searchModuleList',
        data: {'pageSize': 10, 'pageNo': pageNo, 'searchKey': searchKey});
  }

  // 课程详情
  detailCourse(String courseId, {String tutorName}) async {
    return await service().post('$agentMarketingApi/v1/api/course/detailCourse',
        data: {'courseId': courseId, 'tutorName': tutorName});
  }

  detailMeeting(String meetingId) async {
    return await service().post(
        '$agentMarketingApi/v1/api/meeting/detailMeeting',
        data: {"meetingId": meetingId});
  }
}
