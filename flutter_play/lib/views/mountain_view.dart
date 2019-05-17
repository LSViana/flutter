import 'package:flutter/material.dart';

class MountainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //
    return MaterialApp(
      title: 'Mountain View',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mountain View'),
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Image.network(
                    'https://cdn.pixabay.com/photo/2019/03/11/09/53/car-4048220_960_720.jpg',
                  ),
                  // Description row
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mercedes-Benz AMG Black',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Berlin, Germany',
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: theme.primaryColor,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '87',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Actions row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.call, color: theme.primaryColor),
                          SizedBox(height: 8),
                          Text(
                            'CALL',
                            style: TextStyle(color: theme.primaryColor),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.near_me, color: theme.primaryColor),
                          SizedBox(height: 8),
                          Text(
                            'ROUTE',
                            style: TextStyle(color: theme.primaryColor),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.share, color: theme.primaryColor),
                          SizedBox(height: 8),
                          Text(
                            'SHARE',
                            style: TextStyle(color: theme.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                      style: TextStyle(
                        letterSpacing: .6,
                        height: 1.3,
                      ),
                    ),
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
