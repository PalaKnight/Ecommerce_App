import 'dart:async';

import 'package:flutter/material.dart';

import '../../../constants.dart';



class OTPTimer extends StatefulWidget {
  final Function toggle;
  OTPTimer(this.toggle);


  @override
  _OTPTimerState createState() => _OTPTimerState();
}

class _OTPTimerState extends State<OTPTimer> {
  @override
  Widget build(BuildContext context) {
    var interval = Duration(seconds: 1);
    int maximumSecond = 5;
    int currentSecond = 0;

    void startTimer() {
      Timer.periodic(interval, (timer) {
        setState(() {
          currentSecond = timer.tick;
          //
        });
        if (timer.tick >= maximumSecond) {
          timer.cancel();
          widget.toggle();
        }
      }
      );
    }
    @override
    initState(){
      super.initState();
      startTimer();
    }

    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timer,
              color: kPrimaryColor,
            ),
            SizedBox( width: 10,),
            Text(
                 currentSecond.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: kPrimaryColor,
                )
            ),
          ]
      ),
    );
  }
}
