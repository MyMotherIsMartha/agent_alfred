import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void openShareWindow(context, String type) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(G.setWidth(10))),
                      image: DecorationImage(
                          image: AssetImage(
                              type == 'member' ? "lib/assets/images/home/member-share-bg.png" : "lib/assets/images/home/agent-share-bg.png"),
                          fit: BoxFit.contain)),
                  margin: EdgeInsets.only(top: G.setHeight(140)),
                  width: G.setWidth(620),
                  height: G.setWidth(874),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: G.setWidth(20),
                        right: G.setWidth(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: hex('#F9F9F9').withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            width: G.setWidth(44),
                            height: G.setWidth(44),
                            child: Center(
                                child: Icon(Icons.close, size: G.setSp(36))),
                          ),
                        )),
                    Column(children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: G.setWidth(145), bottom: G.setWidth(70)),
                        padding:
                            EdgeInsets.symmetric(horizontal: G.setWidth(110)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image(
                                  width: G.setWidth(80),
                                  height: G.setWidth(80),
                                  image: AssetImage(
                                      'lib/assets/images/home/underway-agent-logo.png')),
                              Container(
                                  margin: EdgeInsets.only(left: G.setWidth(20)),
                                  width: G.setWidth(280),
                                  child: Text('遇上一家旗舰店遇上一家旗舰店',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: G.setSp(30),
                                          fontWeight: FontWeight.w400,
                                          color: type == 'member' ? Colors.black : hex('#E7D1A8'),
                                          decoration: TextDecoration.none,
                                          height: 1.2))),
                            ]),
                      ),
                      QrImage(
                        data: "1234567890",
                        version: QrVersions.auto,
                        foregroundColor: type == 'member' ? Colors.black : hex('#E7D1A8'),
                        size: G.setWidth(380),
                      ),
                      G.spacing(20),
                      Text('邀请码：12345678890',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: G.setSp(28),
                              color: hex('#666666'),
                              decoration: TextDecoration.none,
                              height: 1.2)),
                      G.spacing(15),
                      Text('长按识别二维码立即注册',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: G.setSp(24),
                              color: hex('#666666'),
                              decoration: TextDecoration.none,
                              height: 1.2))
                    ])
                  ]),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                  height: G.setHeight(260),
                  width: G.setWidth(750),
                  padding: EdgeInsets.only(
                      left: G.setWidth(125),
                      right: G.setWidth(125),
                      top: G.setHeight(30)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(G.setWidth(50))),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            G.horizontalLine(207, color: hex('#ccc')),
                            Text('分享',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: G.setSp(24),
                                    color: hex('#ccc'),
                                    decoration: TextDecoration.none,
                                    height: 1.2)),
                            G.horizontalLine(207, color: hex('#ccc')),
                          ]),
                      G.spacing(30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(children: [
                              Image(
                                  width: G.setWidth(100),
                                  height: G.setWidth(100),
                                  image: AssetImage(
                                      'lib/assets/images/home/wechat.png'),
                                  fit: BoxFit.contain),
                              G.spacing(5),
                              Text('微信好友',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: G.setSp(24),
                                      color: hex('#ccc'),
                                      decoration: TextDecoration.none,
                                      height: 1.2)),
                            ]),
                            Column(children: [
                              Image(
                                  width: G.setWidth(100),
                                  height: G.setWidth(100),
                                  image: AssetImage(
                                      'lib/assets/images/home/pyq.png'),
                                  fit: BoxFit.contain),
                              G.spacing(5),
                              Text('朋友圈',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: G.setSp(24),
                                      color: hex('#ccc'),
                                      decoration: TextDecoration.none,
                                      height: 1.2)),
                            ]),
                            Column(children: [
                              Image(
                                  width: G.setWidth(100),
                                  height: G.setWidth(100),
                                  image: AssetImage(
                                      'lib/assets/images/home/download.png'),
                                  fit: BoxFit.contain),
                              G.spacing(5),
                              Text('保存图片',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: G.setSp(24),
                                      color: hex('#ccc'),
                                      decoration: TextDecoration.none,
                                      height: 1.2)),
                            ])
                          ])
                    ],
                  )),
            )
          ],
        );
      });
}
