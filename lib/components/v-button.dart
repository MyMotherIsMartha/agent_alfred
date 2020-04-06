import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';

class VButton extends StatelessWidget {
  final String text;
  final Function fn;
  final double width;
  final double height;
  final double fs;
  final bool disabled;
  VButton({
    @required this.text, 
    @required this.fn,
    this.width = 590,
    this.height = 100,
    this.fs = 36,
    this.disabled = false
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: G.setWidth(width),
      height: G.setHeight(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(G.setHeight(height / 2)),
        gradient: LinearGradient(
          colors: disabled ? [rgba(104,90,255,.3), rgba(105,165,255,.3)]:[hex('#685AFF'), hex('#69A5FF')],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: FlatButton(
        child: Text(text, style: TextStyle(
          color: hex('#FFF'),
          fontSize: G.setSp(fs)
        )),
        onPressed: disabled ? null : fn,
      ),
    );
  }
}
