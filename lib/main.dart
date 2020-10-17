import 'package:flutter/material.dart';
import 'package:MobileCocktailDatabase/drop_down/homemenu.dart' as Home;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home.MyHomePage(title: 'Cocktail App'),
    );
  }
}