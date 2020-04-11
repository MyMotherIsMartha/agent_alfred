import 'package:agent37_flutter/utils/global.dart';
import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VLoading extends StatelessWidget {
  final Color color;
  final double size;
  VLoading({this.color, this.size});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
          color: color ?? hex('#6982FF'), size: G.setWidth(size ?? 80)),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:loading/loading.dart';
// import 'package:loading/indicator/ball_pulse_indicator.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: ShowLoading(),
// //     );
// //   }
// // }

// class VLoading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         // appBar: AppBar(
//         //   title: Text('Loading View'),
//         // ),
//         body: Center(
//           child: Loading(indicator: BallPulseIndicator(), size: 100.0),
//         ));
//   }
// }
