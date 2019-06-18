import 'package:flutter/material.dart';

class CreateAndStyleTextField extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return CreateAndStyleTextFieldState();
  }

}

class CreateAndStyleTextFieldState extends State<CreateAndStyleTextField> {

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
            decoration: InputDecoration(
              labelText: 'Enter your username'
            ),
          ),
        ],
      ),
    );
  }
  
}