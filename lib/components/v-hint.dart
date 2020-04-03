import 'package:agent37_flutter/utils/global.dart';
import 'package:agent37_flutter/utils/validate.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

class VHint extends StatelessWidget {
  final String errorMsg;
  VHint(this.errorMsg);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: G.setWidth(25)),
      alignment: Alignment.centerLeft,
      height: G.setHeight(30),
      child: !Validate.isNon(errorMsg)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error,
                  color: hex('#f33'),
                  size: G.setSp(28),
                ),
                Container(width: G.setWidth(8)),
                Text(errorMsg,
                    style: TextStyle(
                        color: hex('#f33'), height: 1, fontSize: G.setSp(24)))
              ],
            )
          : null,
    );
  }
}
