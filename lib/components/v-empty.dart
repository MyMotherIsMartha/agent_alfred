import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/global.dart';


class VEmpty extends StatelessWidget {
  final String hintText;
  VEmpty(
      {@required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(width: G.setWidth(400),image: AssetImage("lib/assets/images/common/empty.png")),
        Text(hintText)
      ],
    );
  }
}
