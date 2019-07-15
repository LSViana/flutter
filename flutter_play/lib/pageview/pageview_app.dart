import 'package:flutter/material.dart';

class PageViewApp extends StatefulWidget {
  PageViewApp({Key key}) : super(key: key);

  _PageViewAppState createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    //
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: .75,
    );
    _pageController.addListener(() {
      print("Page: ${_pageController.page} | Offset: ${_pageController.offset}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page View App'),
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red[100],
                child: PageViewBody(pageController: _pageController)
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red[200],
                child: PageViewBody()
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class PageViewBody extends StatelessWidget {
  final PageController pageController;

  const PageViewBody({
    Key key,
    this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
        children: <Widget>[
          Container(
            color: Colors.blue[100],
            child: Text('Page 1')
          ),
          Container(
            color: Colors.blue[200],
            child: Text('Page 2')
          ),
        ],
      ),
    );
  }
}
