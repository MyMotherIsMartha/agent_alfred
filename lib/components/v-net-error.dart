import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class VNetError extends StatelessWidget {
  final Function fn;
  VNetError(this.fn);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(width: G.setWidth(400),image: AssetImage("lib/assets/images/common/net-error.png")),
        G.spacing(5),
        Text('网络貌似出了问题', style: TextStyle(
          color: hex('#85868B')
        )),
        G.spacing(28),
        InkWell(
          onTap: () {
            fn();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: G.setWidth(46), vertical: G.setWidth(16)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              border: Border.all(color: hex('#BFBFBF'), width: G.setWidth(1))
            ),
            child: Text('刷新试试', style: TextStyle(
              fontSize: G.setSp(26),
              color: hex('#85868B')
            )),
          ),
        )
      ],
    );
  }
}