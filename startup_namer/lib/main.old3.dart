import 'package:flutter/material.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Greetings, Flutter",
      theme: new ThemeData(
        primaryColor: Colors.deepPurple[700],
        accentColor: Colors.red,
      ),
      home: TutorialHome(),
    );
  }
}

class MyButtonState extends State<MyButton> {

  double _textSize = 12;

  @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          print('My button was tapped!');
          setState(() {
            if(_textSize < 20)
              _textSize++;
            else
              _textSize = 12;
          });
        },
        child: Container(
          height: 36,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            color: Colors.lightBlue[500],
          ),
          child: Center(
            child: Text(
              'Engage',
              style: TextStyle(
                color: Colors.white,
                fontSize: _textSize
              )
            ),
          ),
        ),
      );
    }

}

class MyButton extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MyButtonState();
  
}

class TutorialHomeState extends State<TutorialHome> {

  int _count = 0;

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: Text('Welcome, Lucas'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        // body is the majority of the screen.
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Adding $_count to your friendship network...'),
              MyButton(),
              RaisedButton(
                child: Text(
                  'RAISED BUTTON $_count',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                color: Colors.deepPurple[700]
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add', // used by assistive technologies
          child: Icon(Icons.chat_bubble),
          onPressed: () {
            this.setState(() {
              _count++;
            });
          },
          elevation: 4,
        ),
      );
    }
}

class TutorialHome extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return TutorialHomeState();
    }
}
