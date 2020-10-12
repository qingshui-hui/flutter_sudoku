import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Api.dart';
import 'pages/BoardPage.dart';
import 'Problem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BoardPage(title: 'Flutter Demo Sudoku', problem: Problem.get("1")),
    );
  }
}
