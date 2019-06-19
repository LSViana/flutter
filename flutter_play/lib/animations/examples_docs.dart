import 'package:flutter/cupertino.dart';

class AnimationExamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationExamplesState();
  }
}

class AnimationExamplesState extends State<AnimationExamples> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            'Pow',
          ),
        ],
      ),
    );
  }

}

