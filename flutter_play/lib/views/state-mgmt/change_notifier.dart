import 'package:flutter/material.dart';
import 'package:flutter_play/views/state-mgmt/text_model.dart';
import 'package:provider/provider.dart';

class ChangeNotifierTest extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ChangeNotifierTestState();
  }

}

class ChangeNotifierTestState extends State<ChangeNotifierTest> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Change Provider',
          ),
        ),
        body: ChangeNotifierProvider(
          builder: (context) => TextModel(),
          child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text('Change the following value'),
                    TextForm(),
                    TextField(
                      onChanged: (value) {
                        final provider = Provider.of<TextModel>(context, listen: false);
                        if(provider != null)
                          provider.setText(value);
                      },
                    ),
                    Consumer<TextModel>(
                      builder: (context, textModel, child) {
                      return Text('Text: ${textModel.text}');
                      }
                    ),
                  ],
                ),
              )
          ),
        ),
    );
  }

}

class TextForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        Provider.of<TextModel>(context).setText(value);
      },
    );
  }

}