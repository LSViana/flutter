import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('$MyButton was tapped');
      },
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green[300],
        ),
        child: Center(
          child: Text('Button')
        ),
      ),
    );
  }

}
