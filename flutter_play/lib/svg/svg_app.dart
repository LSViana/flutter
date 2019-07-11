import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgApp extends StatefulWidget {
  const SvgApp({Key key}) : super(key: key);

  @override
  _SvgAppState createState() => _SvgAppState();
}

class _SvgAppState extends State<SvgApp>
with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _dimensionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.addListener(() => setState(() {}));
    _controller.repeat();
    _dimensionAnimation = Tween<double>(
      begin: 120,
      end: 240
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('SVG App')
              ),
              Container(
                child: SvgPicture.asset(
                  'assets/vectors/logo-ls.svg',
                ),
                width: _dimensionAnimation.value,
                height: _dimensionAnimation.value,
              ),
            ]
          ),
        ),
      ),
    );
  }
}
