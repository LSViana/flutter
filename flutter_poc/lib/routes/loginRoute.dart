import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credentials'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.input
            ),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}