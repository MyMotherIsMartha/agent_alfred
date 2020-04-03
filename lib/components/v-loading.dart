import 'package:flutter/material.dart';

class VLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 75,
      width: 75,
      child: CircularProgressIndicator(
        strokeWidth: 4,
        // backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.pink),
      ),
    ));
  }
}
