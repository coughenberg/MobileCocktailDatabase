import 'package:flutter/material.dart';
import 'package:MobileCocktailDatabase/drop_down/homemenu.dart' as Home;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home.MyHomePage(),
    );
  }
}
