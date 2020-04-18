import 'package:agent37_flutter/views/finance/index.dart';
import 'package:agent37_flutter/views/finance/search.dart';
import 'package:agent37_flutter/views/home/fine-print.dart';
import 'package:agent37_flutter/views/index.dart';
import 'package:agent37_flutter/views/login/address.dart';
import 'package:agent37_flutter/views/login/certificate.dart';
import 'package:agent37_flutter/views/login/create-account.dart';
import 'package:agent37_flutter/views/login/create-order.dart';
import 'package:agent37_flutter/views/login/forget.dart';
import 'package:agent37_flutter/views/login/login.dart';
import 'package:agent37_flutter/views/login/order-result.dart';
import 'package:agent37_flutter/views/login/register.dart';
import 'package:agent37_flutter/views/login/update-user.dart';
import 'package:agent37_flutter/views/setting/index.dart';
import 'package:agent37_flutter/views/splash_page.dart';
import 'package:agent37_flutter/views/enterpriseApprove/uploadPic.dart';
import 'package:agent37_flutter/views/enterpriseApprove/uploadForm.dart';
import 'package:agent37_flutter/views/enterpriseApprove/uploadAudit.dart';
import 'package:agent37_flutter/views/vipManage/index.dart';
import 'package:agent37_flutter/views/vipManage/vipDetail.dart';
import 'package:agent37_flutter/views/agentManage/index.dart';
import 'package:agent37_flutter/views/enterpriseApprove/perfectInfo1.dart';
import 'package:agent37_flutter/views/enterpriseApprove/perfectInfo2.dart';
import 'package:agent37_flutter/views/enterpriseApprove/perfectAudit.dart';
import 'package:agent37_flutter/views/enterpriseApprove/readPerfectInfo.dart';
import 'package:fluro/fluro.dart';
import 'package:agent37_flutter/utils/fluro_convert_util.dart';
import 'package:flutter/material.dart';

// splash 页面
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SplashPage();
});

Handler indexHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

Handler registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

Handler forgetHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ForgetPage();
});

Handler updateUserHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return UpdateUserPage();
});

Handler createAccountHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CreateAccountPage();
});

Handler addressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AddressPage();
});

Handler createOrderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String price = params['price']?.first;
  String no = params['no']?.first;
  String promotionNo = params['promotionNo']?.first;
  return CreateOrderPage(price: price, no: no, promotionNo: promotionNo);
});

Handler certificateHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String no = params['no']?.first;
  String time = params['time']?.first;
  return CertificatePage(no: no, time: time);
});

Handler orderResultHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OrderResultPage();
});

Handler finePointHandel = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FinePointPage();
});

Handler uploadEnterPrisePicHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return UploadEnterprisePic();
});

Handler uploadLicenseFormHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String uploadJson = params['uploadJson']?.first;

  return UploadLicenseForm(
    uploadJson: uploadJson,
  );
});

Handler perfectEnterprise1Handler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PerfectEnterprise1();
});

Handler perfectEnterprise2Handler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String legalName = params['legalName']?.first;

  return PerfectEnterprise2(
    legalName: legalName,
  );
});

Handler perfectEnterpriseAuditHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String currentStatus = params['currentStatus']?.first;

  return PerfectEnterpriseAudit(
    currentStatus: currentStatus,
  );
});

Handler readPerfectInfoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ReadPerfectInfo();
});

Handler uploadLicenseAuditHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String status = params['status']?.first;

    return UploadLicenseAudit(
      status: status
    );
  }
);

Handler vipManageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VipManageMain();
});

// 财务管理
Handler financeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FinancePage();
});

// 财务搜索
Handler financeSearchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FinanceSearchPage();
});

// 设置
Handler settingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingPage();
});

Handler vipDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    String vipId = params['vipId']?.first;
    
    return VipDetail(
      vipId: vipId,
    );
  }
);

Handler agentManageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return AgentManageMain();
  }
