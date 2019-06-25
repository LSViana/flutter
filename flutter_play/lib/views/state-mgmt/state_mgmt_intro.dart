import 'package:flutter/material.dart';

class StateMgmt extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return StateMgmtState();
  }

}

class StateMgmtState extends State<StateMgmt> {

  int _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'State Management'
          ),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Text('State Management'),
              ),
              BottomNavigationBar(
                currentIndex: _bottomBarIndex,
                type: BottomNavigationBarType.shifting,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  this.setState(() {
                    _bottomBarIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text(
                      'Home'
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text(
                      'Settings'
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star),
                    title: Text(
                      'Favorites'
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.wifi),
                    title: Text(
                      'Connection'
                    ),
                  ),
                ]
              )
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }

}

class _textWidget {
}