import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'dart:async';

import 'package:agent37_flutter/components/v-avatar.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:agent37_flutter/env.dart';
import 'package:agent37_flutter/provide/user.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/views/home/components/image_gallery_saver_local.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluwx/fluwx.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

void openShareWindow(context, String type, int role) {
  GlobalKey qrCodeKey = GlobalKey();
  String middleUrl = type == 'member' ? '#/createAccount/1?shareCode=' : '#/register?haveCode=true&shareCode=';

  var shareCode = Provider.of<UserProvide>(context).userAuthInfo.shareCode ?? '';
  var nickname = Provider.of<UserProvide>(context).userAuthInfo.nickname ?? '';
  Uint8List bytes = Uint8List.fromList([71, 73, 70, 56, 57, 97, 1, 0, 1, 0, 128, 0, 0, 0, 0, 0, 255, 255, 255, 33, 249, 4, 1, 0, 0, 0, 0, 44, 0, 0, 0, 0, 1, 0, 1, 0, 0, 2, 1, 68, 0, 59]);

  // 获取Uint8List数据
    Future<Uint8List> toPng() async {
    try {
      RenderRepaintBoundary boundary =
      qrCodeKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes; //这个对象就是图片数据
    } catch (e) {
      print(e);
    }
    return null;
    }

  void saveScreen() async {
    RenderRepaintBoundary boundary =
        qrCodeKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result = await ImageGallerySaver2.saveImage(byteData.buffer.asUint8List());
    print(result);
  }

  void saveQrcode() async {
    print('qr code save');
    bool flag;
    // print(await Permission.photos.request().isGranted);
    // var pre;
    Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
    ].request();
    flag = statuses[Permission.photos] == PermissionStatus.granted;
    print('flag');
    print(flag);
    // print(pre);
    // print('权限啊权限');
    if (!flag) {
      G.toast('请在设置中授予相册权限');
      return;
    }
    RenderRepaintBoundary boundary =
        qrCodeKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List picBytes = byteData.buffer.asUint8List();
    // var filePath = await ImagePickerSaver.saveFile(
    //       fileData: byteData.buffer.asUint8List());
    // print(filePath);
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + '/$type.png';
    print(path);
    File(path).writeAsBytes(picBytes);
    // String path =
    //     'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';
    GallerySaver.saveImage(path).then((bool success) {
      print('Image is saved');
      print(success);
      if (success) {
        G.toast('保存图片成功，请到相册查看');
      }
    });
  }

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return
        Column(
          children: <Widget>[
            RepaintBoundary(
              key: qrCodeKey,
              child: 
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
                      margin: EdgeInsets.only(top: G.setWidth(100)),
                      width: G.setWidth(620),
                      height: G.setWidth(874),
                      child: Stack(children: <Widget>[
                        // Positioned(
                        //     top: G.setWidth(20),
                        //     right: G.setWidth(20),
                        //     child: GestureDetector(
                        //       onTap: () {
                        //         Navigator.pop(context);
                        //       },
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           color: hex('#F9F9F9').withOpacity(0.5),
                        //           shape: BoxShape.circle,
                        //         ),
                        //         width: G.setWidth(44),
                        //         height: G.setWidth(44),
                        //         child: Center(
                        //             child: showClose ? Icon(Icons.close, size: G.setSp(36)) : Text('')),
                        //       ),
                        //     )),
                        Column(children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: G.setWidth(145), bottom: G.setWidth(70)),
                            padding:
                                EdgeInsets.symmetric(horizontal: G.setWidth(110)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  VAvatar(null, role, width: 80,),
                                  // Image(
                                  //     width: G.setWidth(80),
                                  //     height: G.setWidth(80),
                                  //     image: AssetImage(
                                  //         'lib/assets/images/home/agent-underway.png')),
                                  Container(
                                      margin: EdgeInsets.only(left: G.setWidth(20)),
                                      width: G.setWidth(280),
                                      child: Text(nickname,
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
                            data: EnvConfig.dev['web-address'] + middleUrl + shareCode,
                            version: QrVersions.auto,
                            foregroundColor: type == 'member' ? Colors.black : hex('#E7D1A8'),
                            size: G.setWidth(380),
                          ),
                          G.spacing(20),
                          Text('邀请码：$shareCode',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: G.setSp(28),
                                  color: hex('#666666'),
                                  decoration: TextDecoration.none,
                                  height: 1.2)),
                          G.spacing(15),
                          Text(type == 'member' ? '长按识别二维码立即注册' : '长按识别二维码立即加入',
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
                )
            ),
            Expanded(
              child: 
            Container(
                  height: G.setHeight(260),
                  width: G.setWidth(750),
                  margin: EdgeInsets.only(top: G.setWidth(60)),
                  padding: EdgeInsets.only(
                      left: G.setWidth(125),
                      right: G.setWidth(125)),
                  child: 
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                var result = await isWeChatInstalled;
                                if (!result) {
                                  G.toast('对不起，您还没有安装微信');
                                  return;
                                }
                                // var picBytes = await toPng();
                                // if (picBytes == null) {
                                //   G.toast('图片解析失败');
                                //   return;
                                // }
                                RenderRepaintBoundary boundary =
                                    qrCodeKey.currentContext.findRenderObject();
                                ui.Image image = await boundary.toImage();
                                ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                                Uint8List picBytes = byteData.buffer.asUint8List();

                                shareToWeChat(
                                  WeChatShareImageModel(WeChatImage.binary(picBytes, suffix: '.png'),
                                  title: 'title1',
                                  description: 'description',
                                  mediaTagName: 'mediaTag Name', 
                                  messageAction: 'messageAction',
                                  messageExt: 'messageExt',
                                  scene: WeChatScene.SESSION));
                              },
                              child:
                              Column(children: [
                                Image(
                                    width: G.setWidth(100),
                                    height: G.setWidth(100),
                                    image: AssetImage(
                                        'lib/assets/images/home/wechat-white.png'),
                                    fit: BoxFit.contain),
                                G.spacing(10),
                                Text('微信好友',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: G.setSp(24),
                                        color: hex('#fff'),
                                        decoration: TextDecoration.none,
                                        height: 1.2)),
                              ])
                            ),
                            GestureDetector(
                              onTap: () async {
                                var result = await isWeChatInstalled;
                                if (!result) {
                                  G.toast('对不起，您还没有安装微信');
                                }

                                var picBytes = await toPng();
                                
                                shareToWeChat(
                                  WeChatShareImageModel(WeChatImage.binary(picBytes, suffix: '.png'),
                                  title: 'title1',
                                  description: 'description',
                                  mediaTagName: 'mediaTag Name', 
                                  messageAction: 'messageAction',
                                  messageExt: 'messageExt',
                                  scene: WeChatScene.TIMELINE));
                              },
                              child: Column(children: [
                                Image(
                                    width: G.setWidth(100),
                                    height: G.setWidth(100),
                                    image: AssetImage(
                                        'lib/assets/images/home/pyq-white.png'),
                                    fit: BoxFit.contain),
                                G.spacing(10),
                                Text('朋友圈',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: G.setSp(24),
                                        color: hex('#fff'),
                                        decoration: TextDecoration.none,
                                        height: 1.2)),
                              ]),
                            ),
                            GestureDetector(
                              onTap: () async {
                                saveQrcode();
                              },
                              child:
                              Column(children: [
                                Image(
                                    width: G.setWidth(100),
                                    height: G.setWidth(100),
                                    image: AssetImage(
                                        'lib/assets/images/home/download-white.png'),
                                    fit: BoxFit.contain),
                                G.spacing(10),
                                Text('保存图片',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: G.setSp(24),
                                        color: hex('#fff'),
                                        decoration: TextDecoration.none,
                                        height: 1.2)),
                              ])
                            )
                          ])
                  )
                ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   child: Container(
            //       height: G.setHeight(260),
            //       width: G.setWidth(750),
            //       padding: EdgeInsets.only(
            //           left: G.setWidth(125),
            //           right: G.setWidth(125),
            //           top: G.setHeight(30)),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.vertical(
            //             top: Radius.circular(G.setWidth(50))),
            //       ),
            //       child: Column(
            //         children: <Widget>[
            //           Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: <Widget>[
            //                 G.horizontalLine(207, color: hex('#ccc')),
            //                 Text('分享',
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.w400,
            //                         fontSize: G.setSp(24),
            //                         color: hex('#ccc'),
            //                         decoration: TextDecoration.none,
            //                         height: 1.2)),
            //                 G.horizontalLine(207, color: hex('#ccc')),
            //               ]),
            //           G.spacing(30),
            //           Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: <Widget>[
            //                 GestureDetector(
            //                   onTap: () async {
            //                     var result = await isWeChatInstalled;
            //                     if (!result) {
            //                       G.toast('对不起，您还没有安装微信');
            //                       return;
            //                     }
            //                     // var picBytes = await toPng();
            //                     // if (picBytes == null) {
            //                     //   G.toast('图片解析失败');
            //                     //   return;
            //                     // }
            //                     RenderRepaintBoundary boundary =
            //                         qrCodeKey.currentContext.findRenderObject();
            //                     ui.Image image = await boundary.toImage();
            //                     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
            //                     Uint8List picBytes = byteData.buffer.asUint8List();

            //                     Directory documentsDirectory = await getTemporaryDirectory();

            //                     String path = documentsDirectory.path + '/$type.png';
            //                     File(path).writeAsBytes(picBytes);

            //                     print(path);

            //                     shareToWeChat(
            //                       WeChatShareImageModel(WeChatImage.asset('/var/mobile/Containers/Data/Application/7299ED24-8BB1-4E21-AD48-F01370BBD0A9/Library/Caches/member.png'),
            //                       title: 'title1',
            //                       description: 'description',
            //                       mediaTagName: 'mediaTag Name', 
            //                       messageAction: 'messageAction',
            //                       messageExt: 'messageExt',
            //                       scene: WeChatScene.SESSION));
            //                   },
            //                   child:
            //                   Column(children: [
            //                     Image(
            //                         width: G.setWidth(100),
            //                         height: G.setWidth(100),
            //                         image: AssetImage(
            //                             'lib/assets/images/home/wechat.png'),
            //                         fit: BoxFit.contain),
            //                     G.spacing(5),
            //                     Text('微信好友',
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.w400,
            //                             fontSize: G.setSp(24),
            //                             color: hex('#ccc'),
            //                             decoration: TextDecoration.none,
            //                             height: 1.2)),
            //                   ])
            //                 ),
            //                 GestureDetector(
            //                   onTap: () async {
            //                     var result = await isWeChatInstalled;
            //                     if (!result) {
            //                       G.toast('对不起，您还没有安装微信');
            //                     }

            //                     toPng().then((data) {
            //                       bytes = data;
            //                       print(bytes);
            //                     });
                                
            //                     shareToWeChat(
            //                       WeChatShareImageModel(WeChatImage.asset('lib/assets/images/Wechat2.jpeg'),
            //                       title: 'title1',
            //                       description: 'description',
            //                       mediaTagName: 'mediaTag Name', 
            //                       messageAction: 'messageAction',
            //                       messageExt: 'messageExt',
            //                       scene: WeChatScene.SESSION));
                                
                                
            //                   },
            //                   child:
            //                   Column(children: [
            //                     Image(
            //                         width: G.setWidth(100),
            //                         height: G.setWidth(100),
            //                         image: AssetImage(
            //                             'lib/assets/images/home/pyq.png'),
            //                         fit: BoxFit.contain),
            //                     G.spacing(5),
            //                     Text('朋友圈',
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.w400,
            //                             fontSize: G.setSp(24),
            //                             color: hex('#ccc'),
            //                             decoration: TextDecoration.none,
            //                             height: 1.2)),
            //                   ]),
            //                 ),
            //                 GestureDetector(
            //                   onTap: () async {
            //                     saveQrcode();
            //                   },
            //                   child:
            //                   Column(children: [
            //                     Image(
            //                         width: G.setWidth(100),
            //                         height: G.setWidth(100),
            //                         image: AssetImage(
            //                             'lib/assets/images/home/download.png'),
            //                         fit: BoxFit.contain),
            //                     G.spacing(5),
            //                     Text('保存图片',
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.w400,
            //                             fontSize: G.setSp(24),
            //                             color: hex('#ccc'),
            //                             decoration: TextDecoration.none,
            //                             height: 1.2)),
            //                   ])
            //                 )
            //               ])
            //         ],
            //       )),
            // )
          ],
        );
      });
}
