import 'package:flutter/cupertino.dart';

class IntroAnimations extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return IntroAnimationsState();
  }

}

class IntroAnimationsState extends State<IntroAnimations> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            'Animations intro',
          ),
        ],
      ),
    );
  }

}