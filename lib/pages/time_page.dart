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
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text("I Love You", style: TextStyle(fontSize: 22),),
        centerTitle: true,
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: days,
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(text: " dias\n", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 35)),
              TextSpan(text: hours),
              TextSpan(text: " horas\n", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 35)),
              TextSpan(text: minutes),
              TextSpan(text: " minutos\n", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 35)),
              TextSpan(text: seconds),
              TextSpan(text: " segundos\n", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 35)),
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.info_outline, color: Colors.white,),
        onPressed: _showDialog,
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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Eu te amo"),
        content: RichText(
          text: TextSpan(
            text: "Meu amor, ",
            style: TextStyle(fontSize: 18, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: "eu te amo!\n", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Sei que vivo lhe dizendo isso, mas a verdade é que você é uma mulher "),
              TextSpan(text: "incrível.\n", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Durmo pensando em "),
              TextSpan(text: "você, ", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "acordo e você é o primeiro pensamento que vem em minha cabeça."),
              TextSpan(text: "Tenho muita sorte em ter você comigo, e não vejo a hora de estarmos juntinhos logo.\n"),
              TextSpan(text: "Vem pra mim, meu amor. vamos ser felizes pra sempre?", style: TextStyle(fontWeight: FontWeight.bold)),
            ]
          ),
        ),
      )
    ); 
  }
}