import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetsAndImages extends StatefulWidget {
  Future<String> loadAsset() async {
    await Future.delayed(Duration(seconds: 3));
    return await rootBundle.loadString('assets/texts/appname.txt');
  }

  @override
  State<StatefulWidget> createState() {
    return _AssetsAndImagesState();
  }
}

class _AssetsAndImagesState extends State<AssetsAndImages> {
  String appName = "";

  @override
  void initState() {
    super.initState();
    //
    widget.loadAsset().then((value) {
      setState(() {
        appName = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Assets and Images',
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('<3'),
              Text(appName),
              ImageDark(),
            ],
          ),
        ),
      ),
    ));
  }
}

class ImageDark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/red.png'),
    );
  }
}
