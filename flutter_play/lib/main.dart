import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(color: Colors.blueAccent),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: [
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Flutterize',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    elevation: 2,
                    child: Container(
                      width: 180,
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Welcome to',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(1e3)
                            ),
                            child: Image(
                              color: Colors.blue,
                              width: 64,
                              height: 64,
                              image: AssetImage('assets/vectors/flutter.png')
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),  
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Nice app', // used by the OS task switcher
    home: MyScaffold(),
  ));
}
