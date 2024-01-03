// import 'dart:async';
//
// import 'package:flutter/material.dart';
// class CircularTimerButton extends StatefulWidget {
//   @override
//   _CircularTimerButtonState createState() => _CircularTimerButtonState();
// }
//
// class _CircularTimerButtonState extends State<CircularTimerButton> {
//   bool _timerActive = false;
//   double _progress = 1.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (!_timerActive) {
//           startTimer();
//         }
//       },
//       child: SizedBox(
//         width: 100.0,
//         height: 100.0,
//         child: CircularProgressIndicator(
//           value: _progress,
//           strokeWidth: 10.0,
//           valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//         ),
//       ),
//     );
//   }
//
//   void startTimer() {
//     const duration = const Duration(seconds:1);
//     Timer.periodic(duration, (Timer timer) {
//       setState(() {
//         _progress -= 1.0 / (5 * 1); // Dividing by (duration * 10) for smoother animation
//         if (_progress <= 0) {
//           timer.cancel();
//           _timerActive = false;
//           _progress = 1.0; // Reset progress when the timer is complete
//         }
//       });
//     });
//
//     setState(() {
//       _timerActive = true;
//     });
//   }
// }