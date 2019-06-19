import 'package:flutter/material.dart';

class AnimationExamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationExamplesState();
  }
}

class AnimationExamplesState extends State<AnimationExamples>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    //
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationController.addListener(() {
      this.setState(() {});
    });
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text('Animated'),
          GrowTransition(
            child: LogoWidget(),
            animation: Tween<double>(begin: 0.0, end: 128.0).animate(animationController),
          )
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
      child: child),
    );
}
