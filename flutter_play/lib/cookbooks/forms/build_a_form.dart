import 'package:flutter/material.dart';

class BuildAForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuildAFormState();
  }
}

class BuildAFormState extends State<BuildAForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Value must not be empty';
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      'SUBMIT',
                    ),
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        Scaffold
                          .of(context)
                          .showSnackBar(
                            SnackBar(
                              content: Text(
                                'Processing information'
                              ),
                            ),
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
