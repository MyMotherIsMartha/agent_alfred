import 'package:agent37_flutter/views/agentManage/agentSearch.dart';
import 'package:agent37_flutter/views/bank/bankForm.dart';
import 'package:agent37_flutter/views/bank/index.dart';
import 'package:agent37_flutter/views/common/resultPage.dart';
import 'package:agent37_flutter/views/finance/index.dart';
import 'package:agent37_flutter/views/finance/search.dart';
import 'package:agent37_flutter/views/home/fine-print.dart';
import 'package:agent37_flutter/views/index.dart';
import 'package:agent37_flutter/views/invoice/invoiceDetail.dart';
import 'package:agent37_flutter/views/invoice/invoiceList.dart';
import 'package:agent37_flutter/views/invoice/sendAddress.dart';
import 'package:agent37_flutter/views/login/address.dart';
import 'package:agent37_flutter/views/login/certificate.dart';
import 'package:agent37_flutter/views/login/create-account.dart';
import 'package:agent37_flutter/views/login/create-order.dart';
import 'package:agent37_flutter/views/login/forget.dart';
import 'package:agent37_flutter/views/login/login.dart';
import 'package:agent37_flutter/views/login/order-result.dart';
import 'package:agent37_flutter/views/login/register.dart';
import 'package:agent37_flutter/views/login/update-user.dart';
import 'package:agent37_flutter/views/marketing/apply-meeting.dart';
import 'package:agent37_flutter/views/marketing/apply-result.dart';
import 'package:agent37_flutter/views/marketing/course.dart';
import 'package:agent37_flutter/views/marketing/meeting.dart';
import 'package:agent37_flutter/views/marketing/module-detail.dart';
import 'package:agent37_flutter/views/marketing/search.dart';
import 'package:agent37_flutter/views/setting/index.dart';
import 'package:agent37_flutter/views/setting/mobile.dart';
import 'package:agent37_flutter/views/setting/nickname.dart';
import 'package:agent37_flutter/views/setting/password.dart';
import 'package:agent37_flutter/views/setting/reset-pwd.dart';
import 'package:agent37_flutter/views/setting/safe.dart';
import 'package:agent37_flutter/views/setting/userinfo.dart';
import 'package:agent37_flutter/views/splash_page.dart';
import 'package:agent37_flutter/views/enterpriseApprove/uploadPic.dart';
import 'package:agent37_flutter/views/enterpriseApprove/uploadForm.dart';
import 'package:agent37_flutter/views/vipManage/index.dart';
import 'package:agent37_flutter/views/vipManage/vipDetail.dart';
import 'package:agent37_flutter/views/agentManage/index.dart';
import 'package:agent37_flutter/views/agentManage/agentVerify.dart';
import 'package:agent37_flutter/views/enterpriseApprove/perfectInfo1.dart';
import 'package:agent37_flutter/views/enterpriseApprove/perfectInfo2.dart';
import 'package:agent37_flutter/views/enterpriseApprove/perfectAudit.dart';
import 'package:agent37_flutter/views/enterpriseApprove/readPerfectInfo.dart';
import 'package:agent37_flutter/views/vipManage/vipSearch.dart';
import 'package:agent37_flutter/views/wallet/billHistory.dart';
import 'package:agent37_flutter/views/wallet/index.dart';
import 'package:agent37_flutter/views/wallet/withdraw.dart';
import 'package:agent37_flutter/views/webview.dart';
import 'package:fluro/fluro.dart';
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
  return CertificatePage(no: no);
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
    String isFirstUpload = params['isFirstUpload']?.first ?? 'yes';;
  return UploadEnterprisePic(
    isFirstUpload: isFirstUpload
  );
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

Handler resultPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String status = params['status']?.first;
    // String title = params['title']?.first ?? 'no';
    String haveExit = params['haveExit']?.first ?? 'yes';
    return ResultPage(
      status: status,
      // title: title,
      haveExit: haveExit
    );
  }
);


//  钱包
Handler walletMainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WalletMain();
});
//  钱包提现页
Handler walletWithdrawHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WalletWithdraw();
});
Handler billHistoryHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BillHistory();
});
Handler invoiceListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return InvoiceList();
});
Handler invoiceDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String invoiceId = params['invoiceId']?.first;
  String status = params['status']?.first;
  return InvoiceDetail(
    invoiceId: invoiceId,
    status: status,
  );
});
Handler sendAdressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SendAddress();
});
//  银行卡主页
Handler bankMainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BankMainPage();
});
//  银行卡表单页
Handler bankFormHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String status = params['status']?.first;
    return BankFormPage(
      status: status
    );
});

Handler vipManageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VipManageMain();
});
Handler vipSearchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VipManageSearch();
});

Handler vipDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    String vipId = params['vipId']?.first.toString();
    return VipDetail(
      vipId: vipId,
    );
  }
);
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

// 设置用户信息
Handler settingUserInfoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingUserInfoPage();
});

// 设置昵称
Handler settingNicknameHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingNicknamePage();
});

// 账户安全
Handler settingSafeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingSafePage();
});

// 登录密码
Handler settingPwdHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingPwdPage();
});

// 重置登录密码
Handler resetPwdHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingResetPwdPage();
});

// 重置手机号
Handler resetMobileHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingMobilePage();
});

Handler agentManageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return AgentManageMain();
  }
);

Handler agentManageSearchHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return AgentManageSearch();
  }
);

Handler agentVerifyHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
    String company = params['company']?.first;
    String mobile = params['mobile']?.first;
    String sharecode = params['sharecode']?.first;
    
    return AgentVerify(
      company: company,
      mobile: mobile,
      sharecode: sharecode
    );
  }
);

// 营销管理搜索
Handler marketSearchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MarketSearchPage();
});

// 参会报名
Handler marketApplyMettingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MarketApplyMettingPage();
});

// 参会报名结果
Handler marketApplyResultHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MarketApplyResultPage();
});

// 营销课程
Handler marketCourseHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String id = params['id']?.first;
      return MarketCoursePage(id);
});

// 营销会议
Handler marketMeetingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String id = params['id']?.first;
      return MarketMeetingPage(id);
});

// 模块详情
Handler moduleDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String id = params['id']?.first;
      return ModuleDetailPage(id);
});

// webview
Handler webviewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String url = params['url'][0];
      return WebPage(url);
});