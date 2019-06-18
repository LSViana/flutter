import 'package:flutter/material.dart';

class CreateAndStyleTextField extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return CreateAndStyleTextFieldState();
  }

}

class CreateAndStyleTextFieldState extends State<CreateAndStyleTextField> {

  @override
  void initState() {
    super.initState();
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
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter a search term'
            ),
          ),
          TextFormField(
            // This property gives focus to the input as soon as it's visible
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Enter your username',
            ),
          ),
        ],
      ),
    );
  }
  
}