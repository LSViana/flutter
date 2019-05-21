import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poc/routes/loginRoute.dart';

class SplashRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashDecoration();
  }
}

class SplashDecoration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashDecorationState();
  }
}

class _SplashDecorationState extends State<SplashDecoration>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    //
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    animation = Tween<double>(begin: 1, end: 0)
      .animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn));
    animation.addStatusListener((status) async {
      if(status == AnimationStatus.completed) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (innerContext) {
              return LoginRoute();
            },
          ),
        );
        controller.stop();
        await Future.delayed(Duration(milliseconds: 300));
        controller.reset();
      }
    });
    animation.addListener(() => setState(() {}));
  }

  void openLogin(BuildContext context) {
    setState(() {
      controller.forward();
    });
  }

  Widget createBackgroundImage(MediaQueryData mediaQuery) {
    return SizedBox(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
      child: Image.network(
        'https://pixabay.com/get/55e5d4414c54b108feda84608229357b103bdfe7504c704c70277fd29f4dc659/pyrenees-351266_1920.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget createFloatingActionButton(BuildContext context) {
    final Matrix4 matrix = Matrix4.identity();
    if(animation.status != AnimationStatus.dismissed) {
      matrix.rotateZ(animation.value * 2 * pi);
      matrix.scale(animation.value);
    }
    // Applying animated values if it's active
    return Positioned(
      right: 0,
      bottom: 0,
      child: Transform(
        alignment: Alignment.center,
        transform: matrix,
        child: FloatingActionButton(
          child: Icon(Icons.explore),
          onPressed: () {
            openLogin(context);
          },
        ),
      ),
    );
  }

  Widget createCard(ThemeData theme) {
    return Card(
      margin: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 28,
                ),
                children: [
                  TextSpan(text: 'Explore '),
                  TextSpan(
                    text: 'Flutter',
                    style: TextStyle(
                      color: theme.accentColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    //
    var children2 = <Widget>[
      createBackgroundImage(mediaQuery),
      Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 64),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              createCard(theme),
              createFloatingActionButton(context),
            ],
          )),
    ];
    return Scaffold(
      body: Container(
        child: Stack(
          children: children2,
        ),
      ),
    );
  }
}
