import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';

import '../utils/global.dart';
import 'Icon.dart';

class VCircleInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon prefixIcon;
  final Function validator;
  final Function onChange;
  final Widget suffix;
  final TextInputType type;
  final int maxLength;
  final Widget suffixIcon;
  final String value;
  VCircleInput(
      {@required this.controller,
      @required this.hintText,
      this.type,
      this.prefixIcon,
      this.validator,
      this.onChange,
      this.suffix,
      this.suffixIcon,
      this.maxLength,
      this.value});
  @override
  _VCircleInputState createState() => _VCircleInputState();
}

class _VCircleInputState extends State<VCircleInput> {
  bool _hasdeleteIcon = false;
  FocusNode _focus = FocusNode();
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
      widget.controller.value = TextEditingValue(text: widget.value);
    }
  }

  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: G.setHeight(100),
        decoration: BoxDecoration(
            color: hex('#F8F8F8'),
            borderRadius: BorderRadius.circular(G.setHeight(50))),
        padding: EdgeInsets.symmetric(
            horizontal: G.setWidth(50), vertical: G.setHeight(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: G.setWidth(20)),
              child: widget.prefixIcon
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: G.setHeight(18)),
                child: TextFormField(
                // strutStyle: StrutStyle(
                //   height: 1
                // ),
                  textAlignVertical: TextAlignVertical.bottom,
                  keyboardType: widget.type,
                  controller: widget.controller,
                  focusNode: _focus,
                  obscureText: widget.type == TextInputType.visiblePassword,
                  maxLength: widget.maxLength,
                  buildCounter: (context, {currentLength, isFocused, maxLength}) => null,
                  
                  style: TextStyle(
                      fontSize: G.setSp(32),
                      // height: 1,
                      textBaseline: TextBaseline.alphabetic),
                  decoration: InputDecoration(
                    
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      // prefixIcon: Container(
                      //   margin: EdgeInsets.only(top: 10),
                      //   child: widget.prefixIcon,
                      // ),
                      // suffixIcon: widget.suffixIcon != null
                      //     ? widget.suffixIcon
                      //     : _hasdeleteIcon
                      //         ? IconButton(
                      //             icon: iconclose(),
                      //             onPressed: () {
                      //               clearText(widget.controller);
                      //             },
                      //           )
                      //         : null
                              ),
                  onChanged: (str) {
                    // String newStr = str.substring(0, widget.maxLength);
                    // widget.controller.value = TextEditingValue(
                    //   text: newStr,
                    //   selection: TextSelection.fromPosition(
                    //     TextPosition(affinity: TextAffinity.downstream, offset: newStr.length)
                    //   )
                    // );
                    widget.onChange(str);
                    setState(() {
                      _hasdeleteIcon = (str.isNotEmpty);
                    });
                  },
                  validator: widget.validator),
            )),
            Container(
              child: widget.suffixIcon != null
                          ? widget.suffixIcon
                          : _hasdeleteIcon
                              ? IconButton(
                                  icon: iconclose(),
                                  onPressed: () {
                                    clearText(widget.controller);
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
