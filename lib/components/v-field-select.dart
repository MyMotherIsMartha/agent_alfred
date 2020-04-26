import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';
import 'Icon.dart';

class VFieldSelect extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final Function validator;
  final String value;
  final Function onTap;
  final double labelWidth;
  VFieldSelect(
      {@required this.controller,
      @required this.hintText,
      this.label,
      this.validator,
      this.onTap,
      this.labelWidth,
      this.value});
  @override
  _VFieldSelectState createState() => _VFieldSelectState();
}

class _VFieldSelectState extends State<VFieldSelect> {

  Widget build(BuildContext context) {
    return Container(
        height: G.setHeight(100),
        padding: EdgeInsets.symmetric(
          horizontal: G.setWidth(30)),
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: hex('#eee'), width:  G.setWidth(1)))),
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
                  child: InkWell(
                      onTap: () {
                        if (widget.onTap != null) {
                          widget.onTap();
                        }
                      },
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: widget.controller,
                              // initialValue: '1234',
                              onTap: () {
                                if (widget.onTap != null) {
                                  widget.onTap();
                                }
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: widget.hintText),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return widget.hintText;
                                }
                                return null;
                              },
                            ),
                          ),
                          // Text(city ?? '请选择'),
                          iconarrow(size: G.setWidth(35))
                        ],
                      ),
                    ),
                  ),
              ],
            ),
      );
  }
}
