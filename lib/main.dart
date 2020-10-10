import 'package:flutter/material.dart';
import 'package:new_flutter_project_prt2/drop_down/homemenu.dart' as Home;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home.MyHomePage(),
    );
  }
}
