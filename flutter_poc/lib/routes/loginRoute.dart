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
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            createLoginForm(context),
          ],
        ),
      ),
    );
  }

  Widget createLoginForm(BuildContext context) {
    final theme = Theme.of(context);
    //
    return Container(
      child: Card(
        elevation: 4,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Credentials',
                style: theme.textTheme.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
