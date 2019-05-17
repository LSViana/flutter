import 'package:flutter/material.dart';

class MountainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mountain View'),
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Image.network(
                    'https://cdn.pixabay.com/photo/2019/03/11/09/53/car-4048220_960_720.jpg',
                  ),
                  // Description row
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Mercedes-Benz AMG Black',
                            ),
                            Text('Berlin, Germany')
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: theme.primaryColor,
                            ),
                            Text('87'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.call, color: theme.primaryColor),
                          Text(
                            'CALL',
                            style: TextStyle(color: theme.primaryColor),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.near_me, color: theme.primaryColor),
                          Text(
                            'ROUTE',
                            style: TextStyle(color: theme.primaryColor),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.share, color: theme.primaryColor),
                          Text(
                            'SHARE',
                            style: TextStyle(color: theme.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
