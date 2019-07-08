import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:love_you/pages/time_page.dart';

void main() => runApp(LoveYouApp());

class LoveYouApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I Love You",
      home: TimePage(),
    );
  }
}