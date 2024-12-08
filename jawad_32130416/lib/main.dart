import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(TipCalculatorApp());
}

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TipCalculatorScreen(),
    );
  }
}
