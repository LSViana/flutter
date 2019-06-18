import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;

const String BaseAddress = 'http://10.0.3.2:5000';

class HttpFilesTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpFilesTestState();
  }
}

class HttpFilesTestState extends State<HttpFilesTest> {
  String fileName = 'truth.txt';
  String fileContent = 'Flutter is nice';
  String readFileContent = '(empty)';
  TextEditingController fileNameController;
  TextEditingController fileContentController;

  HttpFilesTestState() {
    fileNameController = TextEditingController(text: fileName);
    fileNameController.addListener(() {
      this.setState(() {
        fileName = fileNameController.text;
      });
    });
    fileContentController = TextEditingController(text: fileContent);
    fileContentController.addListener(() {
      this.setState(() {
        fileContent = fileContentController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Http and Files Test',
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'HTTP',
                            ),
                            Row(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text('LIST'),
                                  onPressed: this.performHttpList,
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Files',
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(height: 4),
                                TextField(
                                  controller: fileNameController,
                                  decoration: InputDecoration(
                                    hintText: fileName,
                                    labelText: 'File name',
                                    contentPadding: EdgeInsets.only(bottom: 4),
                                  ),
                                ),
                                SizedBox(height: 8),
                                TextField(
                                  controller: fileContentController,
                                  onChanged: (value) {
                                    this.setState(() => fileContent = value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: fileContent,
                                    labelText: 'File content',
                                    contentPadding: EdgeInsets.only(bottom: 4),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  this.readFileContent,
                                ),
                                SizedBox(height: 4),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text('WRITE'),
                                  onPressed: this.writeFile,
                                ),
                                SizedBox(width: 8),
                                RaisedButton(
                                  child: Text('READ'),
                                  onPressed: this.readFile,
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future writeFile() async {
    var directory = await path_provider.getApplicationDocumentsDirectory();
    var path = directory.path;
    try {
      var file = File('$path/$fileName');
      await file.create();
      await file.writeAsString(fileContent);
      print('File wrote');
    } catch (e) {
      print(e);
    }
  }

  Future readFile() async {
    var directory = await path_provider.getApplicationDocumentsDirectory();
    var path = directory.path;
    try {
      var file = File('$path/$fileName');
      if (await file.exists()) {
        var content = await file.readAsString();
        this.setState(() => readFileContent = content);
        print('File read');
      } else {
        this.setState(() => readFileContent = '(file doesn\'t exist');
      }
    } catch (e) {
      print(e);
    }
  }

  Future performHttpList() async {
    try {
      var response = await http.get(BaseAddress + '/api/values');
      var contents = json.decode(response.body);
      print(contents);
    } catch (e) {
      print(e);
    }
  }
}
