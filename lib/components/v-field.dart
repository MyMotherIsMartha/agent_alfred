import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';
import 'Icon.dart';

class VField extends StatefulWidget {
  final String label;
  final String fieldVal;
  VField(
      {@required this.label,
      @required this.fieldVal});
  @override
  _VFieldState createState() => _VFieldState();
}

class _VFieldState extends State<VField> {

  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: G.setHeight(100),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: hex('#eee'), width: G.setWidth(1)))
        ),
        padding: EdgeInsets.symmetric(
            horizontal: G.setWidth(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: G.setWidth(160),
              child: Text(widget.label, style: TextStyle(
                fontSize: G.setSp(30),
                color: hex('#666')
              ))
            ),
            Expanded(
              child: Text(widget.fieldVal, style: TextStyle(color: hex('#999'), fontSize: G.setSp(30)),)
            )
          ],
        ));
  }
}
