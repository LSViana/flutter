import 'package:flutter/material.dart';
import 'package:flutter_poc/routes/splashRoute.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PoC',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.blue[400],
        splashColor: Colors.blue[900],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900]
        ),
      ),
      home: SplashRoute()
    );
  }
}