import 'package:flutter/material.dart';
import 'package:flutter_play/components/my_button.dart';
import '../resources/strings.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: Strings.menu, // Used for accessibility
          onPressed: () {
            print('Great work!');
          },
        ),
        title: Text(Strings.welcome),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Home screen'),
            MyButton()
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: Strings.info,
        child: Icon(Icons.info),
        onPressed: () {
          print('Hold for tooltip');
        },
      ),
    );
  }

}