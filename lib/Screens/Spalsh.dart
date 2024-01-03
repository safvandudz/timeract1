import 'dart:async';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'MainPage.dart';
class Splsh extends StatefulWidget {
  const Splsh({super.key});

  @override
  State<Splsh> createState() => _SplshState();
}

class _SplshState extends State<Splsh> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => HomeScreen()
                )
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,body:
    Column(
      children: [
        Expanded(
          child:Container(width: double.maxFinite,
            decoration: BoxDecoration(),
            child:  Center(child:Container(width: 500,height: 500,child: Lottie.asset(
              'Assets/Animation - 1704173022708.json', // Replace with the actual file path
              height: 200, // Set the desired height
              width: 170,
            )
              ,)
            ),
          ),
        ),
      ],
    ),
    );
  }
}
