import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationsIntro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationsIntroState();
  }
}

class AnimationsIntroState extends State<AnimationsIntro>
with SingleTickerProviderStateMixin {

  AnimationController animationController;
  CurvedAnimation curvedAnimation;
  ColorTween colorTween;

  AnimationsIntroState() {
    this.animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    this.animationController.addListener(() {
      this.setState(() {});
    });
    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    colorTween = ColorTween(begin: Colors.red, end: Colors.amber);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Animations Intro'),
          // Easy way to add spacing
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                ),
                onPressed: () {
                  animationController.reverse();
                },
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1e10),
                  color: colorTween.evaluate(curvedAnimation),
                ),
                width: 64,
                height: 64,
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.red
                ),
                onPressed: () {
                  animationController.forward();
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Slider(
            value: animationController.value,
            onChanged: (value) {
              animationController.stop();
              setState(() {
                animationController.value = value;
              });
            },
          ),
        ],
      )
    );
  }

}
