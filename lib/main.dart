import 'package:flutter/material.dart';
import 'package:timeract1/Screens/MainPage.dart';


void main() {
  runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: HomeScreen(),);
  }
}
