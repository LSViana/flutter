import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final int favoriteCount;
  
  FavoriteWidget({
    this.favoriteCount
  });

  @override
  State<StatefulWidget> createState() {
    return _FavoriteWidgetState();
  }
  
}

// Members or classes that start with underscore (_) are private
class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(_isFavorited ? Icons.star : Icons.star_border),
          color: theme.accentColor,
          onPressed: _toggleFavorite,
        ),
        SizedBox(
          width: 24,
          child: Text(
            '${widget.favoriteCount + (_isFavorited ? 1 : 0)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      // XOR or = !value, both are valid
      _isFavorited ^= true;
    });
  }

}

class ItemDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //
    return Row(
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Berlin, Germany',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    FavoriteWidget(favoriteCount: 87),
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
                      Icon(Icons.call, color: theme.accentColor),
                      SizedBox(height: 8),
                      Text(
                        'CALL',
                        style: TextStyle(color: theme.accentColor),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.near_me, color: theme.accentColor),
                      SizedBox(height: 8),
                      Text(
                        'ROUTE',
                        style: TextStyle(color: theme.accentColor),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.share, color: theme.accentColor),
                      SizedBox(height: 8),
                      Text(
                        'SHARE',
                        style: TextStyle(color: theme.accentColor),
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
                    letterSpacing: .5,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

class MountainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mountain View',
      /*
        This theme only applies for further calls to Theme.of(context).
        It means that the theme recovered in the beginning of this method isn't affected.
      */
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: Brightness.dark,
        primaryColor: Colors.orange[900],
        accentColor: Colors.yellow[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mountain View'),
        ),
        body: ItemDetails(),
      )
    );
  }
}
