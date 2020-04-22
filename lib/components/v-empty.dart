import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';

class VEmpty extends StatelessWidget {
  final String hintText;
  VEmpty(
      {@required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(width: G.setWidth(400),image: AssetImage("lib/assets/images/common/empty.png")),
        Text(hintText, style: TextStyle(
          color: hex('#85868B')
        ))
      ],
    );
  }
}
