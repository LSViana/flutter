import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildAForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuildAFormState();
  }
}

class BuildAFormState extends State<BuildAForm> {

  final _formKey = GlobalKey<FormState>();
  bool _switch = false;
  double _slider = 0;

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
                  Slider(
                    value: _slider,
                    onChanged: (value) {
                      setState(() {
                        _slider = value;
                      });
                    },
                  ),
                  Switch(
                    value: _switch,
                    onChanged: (value) {
                      setState(() {
                        _switch = value;
                      });
                    },
                  ),
                  CupertinoSwitch(
                    value: _switch,
                    onChanged: (value) {
                      setState(() {
                        _switch = value; 
                      });
                    },
                  ),
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
