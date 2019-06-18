import 'package:flutter/material.dart';

class FocusTextFields extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return FocusTextFieldsState();
  }

}

class FocusTextFieldsState extends State<FocusTextFields> {

  FocusNode userNameFocusNode;
  FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    userNameFocusNode = new FocusNode();
    searchFocusNode = new FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    userNameFocusNode.dispose();
    searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            focusNode: searchFocusNode,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter a search term'
            ),
          ),
          TextFormField(
            // This property gives focus to the input as soon as it's visible
            autofocus: true,
            focusNode: userNameFocusNode,
            decoration: InputDecoration(
              labelText: 'Enter your username',
            ),
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'FOCUS USERNAME'
                ),
                onPressed: () {
                  FocusScope
                    .of(context)
                    .requestFocus(userNameFocusNode);
                },
              ),
              SizedBox(width: 8),
              RaisedButton(
                child: Text(
                  'FOCUS SEARCH'
                ),
                onPressed: () {
                  FocusScope
                    .of(context)
                    .requestFocus(searchFocusNode);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
  
}