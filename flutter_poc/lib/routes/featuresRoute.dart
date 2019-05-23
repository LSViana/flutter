import 'package:flutter/material.dart';

class FeaturesRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark()
        .copyWith(
          primaryColor: Colors.pink,
          accentColor: Colors.yellow[700],
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Magic Flutter'),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Feature title'
                ),
                leading: Icon(Icons.favorite),
                subtitle: Text(
                  'Feature quick description',
                ),
                onTap: () {
                  print('pow');
                }
              ),
              Divider(height: 1),
              ListTile(
                title: Text(
                  'Feature title'
                ),
                leading: Icon(Icons.favorite),
                subtitle: Text(
                  'Feature quick description',
                ),
                onTap: () {
                  print('pow');
                }
              ),
              Divider(height: 1),
            ],
          ),
        ),
      )
    );
  }

}