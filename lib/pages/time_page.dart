import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {

  String days;
  String hours;
  String minutes;
  String seconds;

  @override
  void initState() {
    super.initState();
    _startLoop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$days dias, $hours horas, $minutes minutos, $seconds segundos"),
      ),
    );
  }

  void _startLoop() async {
      while(true) {
        _getDates();
        await Future.delayed(Duration(seconds: 1));
      }
  }

  void _getDates() {
    final now = DateTime.now();
    final loveDate = DateTime.utc(2019, 12, 28, 12);

    final dif = loveDate.difference(now);
    final splitResult = dif.toString().split(":");
    setState(() {
      days = (dif.inHours ~/ 24).toString();
      hours = (dif.inHours % 24).toString();
      minutes = splitResult[1];
      seconds = splitResult[2].substring(0, 2); 
    });
  }
}