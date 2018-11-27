import 'package:flutter/material.dart';

void main() {
  runApp(MainWigdet());
}

class MainWigdet extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Introduction to Flutter',
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.orange,
          fontFamily: 'Montserrat'
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome to home!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(
            child: Container(
              child: Text(
                'Greetings, universe!',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: Offset(1, 1)
                  )
                ]
              ),
            )
          ),
        )
      );
    }
}