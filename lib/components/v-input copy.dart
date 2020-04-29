import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';
import 'Icon.dart';

class VInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final Function validator;
  final Function onChange;
  final Widget suffix;
  final TextInputType type;
  final int maxLength;
  final Widget suffixIcon;
  final String value;
  final bool readOnly;
  final Function onTap;
  VInput(
      {@required this.controller,
      @required this.hintText,
      this.type,
      this.label,
      this.validator,
      this.onChange,
      this.suffix,
      this.suffixIcon,
      this.maxLength,
      this.readOnly,
      this.onTap,
      this.value});
  @override
  _VInputState createState() => _VInputState();
}

class _VInputState extends State<VInput> {
  bool _hasdeleteIcon = false;
  FocusNode _focus = FocusNode();
  FocusNode _focusReadonly = FocusNode();
  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      if (!_focus.hasFocus) {
        setState(() {
          _hasdeleteIcon = false;
        });
      } else {
        setState(() {
          _hasdeleteIcon = widget.controller.text != null &&
              widget.controller.text.isNotEmpty;
        });
      }
    });
    if (widget.value != null && widget.value.isNotEmpty) {
      print('widget value');
      print(widget.value);
      widget.controller.value = TextEditingValue(text: widget.value);
    }
  }

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
              child: Container(
                alignment: Alignment.center,
                
                child: 
                TextFormField(
                  textAlignVertical: TextAlignVertical.bottom,
                  keyboardType: widget.type,
                  controller: widget.controller,
                  focusNode: widget.readOnly != null ? _focusReadonly : _focus,
                  onTap: () {
                    if (widget.onTap != null) {
                      widget.onTap();
                    }
                  },
                  readOnly: widget.readOnly??false,
                  obscureText: widget.type == TextInputType.visiblePassword,
                  maxLength: widget.maxLength,
                  buildCounter: (context, {currentLength, isFocused, maxLength}) => null,
                  
                  style: TextStyle(
                      // fontSize: G.setSp(32),
                      // height: 1.3,
                      // textBaseline: TextBaseline.alphabetic
                      ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                              ),
                  onChanged: (str) {
                    widget.onChange(str);
                    setState(() {
                      _hasdeleteIcon = (str.isNotEmpty);
                    });
                  },
                  validator: widget.validator),
            )
            ),
            Container(
              child: widget.suffixIcon != null
                          ? widget.suffixIcon
                          : _hasdeleteIcon
                              ? IconButton(
                                  icon: iconclose(),
                                  onPressed: () {
                                    clearText(widget.controller);
                                    widget.onChange(null);
                                  },
                                )
                              : null,
            ),
            widget.suffix != null ? widget.suffix : Container()
          ],
        ));
  }

  void clearText(_controller) {
    setState(() {
      _hasdeleteIcon = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.clear());
  }
}
