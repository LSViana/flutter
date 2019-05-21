import 'package:flutter/material.dart';
import 'package:flutter_poc/routes/splashRoute.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PoC',
      theme: ThemeData(
        primaryColor: Colors.blue[600],
        accentColor: Colors.orangeAccent[700],
        splashColor: Colors.orangeAccent[700],
        iconTheme: IconThemeData(
          color: Colors.orangeAccent[700],
        ),
      ),
      home: SplashRoute()
    );
  }
}