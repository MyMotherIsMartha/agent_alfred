import 'package:flutter/material.dart';

class SettringNicknamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('昵称'),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Text('确定'),
          )
        ],
      ),
    );
  }
}