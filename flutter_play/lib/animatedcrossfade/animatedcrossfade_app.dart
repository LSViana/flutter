import 'package:flutter/material.dart';

class AnimatedCrossFadeApp extends StatefulWidget {
  AnimatedCrossFadeApp({Key key}) : super(key: key);

  _AnimatedCrossFadeAppState createState() => _AnimatedCrossFadeAppState();
}

class _AnimatedCrossFadeAppState extends State<AnimatedCrossFadeApp> {
  CrossFadeState _crossFadeState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Animated Cross Fade App',
          ),
        ),
        body: Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _crossFadeState =
                          _crossFadeState == CrossFadeState.showFirst
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst;
                    });
                  },
                  child: Text('Expandable child'),
                ),
                AnimatedCrossFade(
                  crossFadeState: _crossFadeState,
                  duration: Duration(milliseconds: 300),
                  firstChild: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                  secondChild: Container(
                    height: 200,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
