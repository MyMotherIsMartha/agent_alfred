import 'package:agent37_flutter/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:agent37_flutter/utils/validate.dart';

class VAvatar extends StatelessWidget {
  final String url;
  final int role;
  final double width;
  VAvatar(this.url, this.role, {this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: G.setWidth(width??60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50)
      ),
      child: Validate.isNon(url)
              ? avatarIcon(role)
              : Container(
                  decoration: BoxDecoration(),
                child: Image.network(''),
              )
    );
  }

  Widget avatarIcon(int role) {
    return Image.asset('${G.imgBaseUrl}pic-icon/role$role.png');
  }
}