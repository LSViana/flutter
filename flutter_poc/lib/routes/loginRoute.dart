import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_poc/core/models/login.dart';
import 'package:flutter_poc/routes/featuresRoute.dart';
import 'package:http/http.dart' as http;

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute>
  with SingleTickerProviderStateMixin {

  String email = "lucas@gmail.com";
  String password = "Asdf1234";
  bool invalidCredentials = false;
  bool loadingRequest = false;

  void performLogin() async {
    // Create the model to send
    final login = Login(email: email, password: password);
    // Build JSON from model
    final loginJson = jsonEncode({
      "email": login.email,
      "password": login.password,
    });
    // Create client and send the request
    final client = http.Client();
    setState(() {
      loadingRequest = true;
    });
    final response = await client.post(
      'http://10.0.2.2:9000/api/login',
      headers: {
        'Content-Type': 'application/json',
      },
      body: loginJson,
    );
    setState(() {
      loadingRequest = false;
    });
    // If it's correct, keep going
    if (response.statusCode == 200) {
      setState(() {
        email = "";
        password = "";
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return FeaturesRoute();
          },
        ),
      );
    } else if (response.statusCode == 404) {
      setState(() {
        invalidCredentials = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.network(
              'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/earth-from-space-asia-view-johan-swanepoel.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 40),
                  child: createLoginForm(context),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: loadingRequest ? null : () {
                          performLogin();
                        },
                        backgroundColor: loadingRequest ? Colors.grey : null,
                        child: Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createLoginForm(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24)
            .add(const EdgeInsets.only(right: 16)),
        child: Row(
          children: <Widget>[
            Expanded(
              child: createLoginFields(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget createLoginFields(BuildContext context) {
    final theme = Theme.of(context);
    //
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Credentials',
              style: theme.textTheme.title.merge(
                TextStyle(color: theme.primaryColor),
              ),
            )
          ],
        ),
        TextField(
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            prefixIcon: Icon(Icons.email),
            labelText: 'E-mail',
          ),
          onChanged: (value) {
            setState(() { email = value; invalidCredentials = false; });
          },
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            prefixIcon: Icon(Icons.security),
            labelText: 'Password',
            errorText: invalidCredentials ? 'Invalid credentials' : null,
          ),
          onChanged: (value) {
            setState(() { password = value; invalidCredentials = false; });
          },
          onEditingComplete: () => performLogin(),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
