import 'package:flutter/material.dart';

class ChangesTextField extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ChangesTextFieldState();
  }

}

class ChangesTextFieldState extends State<ChangesTextField> {

  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //
    textController.addListener(() {
      printValue(textController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            'Handling changes to a text field'
          ),
          TextField(
            decoration: InputDecoration(
              labelText: '$TextField with onChanged'
            ),
            onChanged: (value) {
              printValue(value);
            },
          ),
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: '$TextFormField with $TextEditingController'
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void printValue(String value) {
    if(value == null || value.isEmpty) {
      print("Text is null or empty");
    }
    else {
      print("New text: $value");
    }
  }

}