import 'package:flutter/material.dart';
import 'package:color_dart/color_dart.dart';

Border borderBottom({Color color, bool show = true}) {
  return Border(
      bottom: BorderSide(
          color: (color == null || !show)
              ? (show ? rgba(242, 242, 242, 1) : Colors.transparent)
              : color,
          width: 1));
}
