import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _timerActive = false;
  double _progress = 1.0;
  bool Success = false;
  int countdown = 5;
  int currentsecond = 0;
  int randomnumber = 0;
  int Attempt1 = 0;
  int Attempt2 = 0;
  String? Massage = 'Sorry try again !';
  late Timer timer;
  DateTime? tapTime;
  Color primar = Colors.orange;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        currentsecond++;
        if (currentsecond == 60) {
          currentsecond = 0;
        }
      });
    });
    tapTime = DateTime.now();
    if (!_timerActive) {
      startTimer();
    }
  }

  int _generateRandomNumber() {
    return Random().nextInt(60);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 94, 84, 1),
        foregroundColor: Color.fromRGBO(7, 94, 84, 1),
        toolbarHeight: 80,
        title: Text(
          'TimerQ',
          style: TextStyle(
              fontSize: 30, color: Colors.white54, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 175,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Current Second',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 1,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            '$currentsecond',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                width: 175,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Random Number',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 1,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            '$randomnumber',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            width: double.maxFinite,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: primar,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 15),
                    child: Text(
                      '$Massage',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 15),
                    child: Row(
                      children: [
                        Text(
                          'Attempts: $Attempt2 ',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Visibility(
                          visible: Success,
                          child: Text(
                            '/ $Attempt1',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 100,
          child: Stack(alignment: Alignment.center, children: [
            Text(
              '$countdown',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: CircularProgressIndicator(
                value: _progress,
                strokeWidth: 10.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ]),
        ),
        SizedBox(height: 20),
        GestureDetector(
            onTap: () {
              randomnumber = _generateRandomNumber();
              Attempt1++;
              Success = true;
            },
            child: Container(
              width: 180,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Center(
                  child: Text(
                'Click',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
            ))
      ]),
    );
  }

  void startTimer() {
    const duration = const Duration(seconds: 1);
    Timer.periodic(duration, (Timer timer) {
      setState(() {
        countdown--;
        _progress -= 1.0 / (5 * 1);
        if (currentsecond == randomnumber) {
          primar = Colors.green;
          Massage = 'Success:)';
          Attempt2++;
          timer.cancel();
          super.dispose();
        }

        if (_progress <= 0) {
          timer.cancel();
          _timerActive = false;
          Attempt1++;
          startTimer();
          _progress = 1.0;
        }
      });
    });

    setState(() {
      countdown = 5;
      _timerActive = true;
    });
  }
}
