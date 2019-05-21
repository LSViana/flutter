import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  void openAbout(BuildContext context) async {
    // await Navigator.pushNamed(context, '/about');
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return Center(child: Text('My PageRoute'));
            },
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to Flutterize! 🎉',
              ),
              SizedBox(height: 8),
              RaisedButton(
                child: Text(
                  'ABOUT',
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  openAbout(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'This is an app made with Flutter and 🧡.',
            ),
            FlatButton(
              child: Text('GO BACK'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
        ),
      ),
    );
  }
}
