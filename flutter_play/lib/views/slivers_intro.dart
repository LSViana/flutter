import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SliversIntro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SliversIntroState();
  }
}

Color getRandomColor() {
  var random = Random();
  return Color.fromARGB(
      255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      onTap: () {
        print('Tapped in header!');
      },
      child: SizedBox.expand(child: child),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    // If something's changed, rebuild
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class SliversIntroState extends State<SliversIntro>
    with SingleTickerProviderStateMixin {
  ScrollController scrollViewController;
  TabController tabController;


  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: false,
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 120.0,
        child: Container(
            color: Color.fromARGB(255, 64, 128, 255),
            child: Center(child: Text(headerText))),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scrollViewController = ScrollController();
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: new NestedScrollView(
          controller: scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: new Text('WhatsApp'),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                bottom: new TabBar(
                  tabs: <Tab>[
                    new Tab(text: "STATISTICS"),
                    new Tab(text: "HISTORY"),
                  ],
                  controller: tabController,
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[Text('oi'), Text('hi')],
            controller: tabController,
          ),
        ),
      ),
      /*
      home: Scaffold(
        body: Container(
          child: CustomScrollView(
            dragStartBehavior: DragStartBehavior.start,
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Infinite Scrolling',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                floating: false,
                // snap: true,
                expandedHeight: 120,
              ),
              SliverAppBar(
                pinned: true,
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Header 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 4,
                children: [
                  Container(color: Colors.red, height: 150.0),
                  Container(color: Colors.purple, height: 150.0),
                  Container(color: Colors.green, height: 150.0),
                  Container(color: Colors.orange, height: 150.0),
                  Container(color: Colors.yellow, height: 150.0),
                  Container(color: Colors.pink, height: 150.0),
                  Container(color: Colors.cyan, height: 150.0),
                  Container(color: Colors.indigo, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                ],
              ),
              SliverAppBar(
                pinned: true,
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Header 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
              SliverAppBar(
                pinned: true,
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Header 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if(index >= 10)
                      return null;
                    print('Creating child $index');
                    return Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          fontSize: 72,
                        ),
                      ),
                      color: getRandomColor()
                    );
                  },
                ),
              ),
              makeHeader('Header 4'),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
              makeHeader('Header 5'),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
              makeHeader('Header 6'),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
              makeHeader('Header 7'),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
              makeHeader('Header 8'),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
              makeHeader('Header 9'),
              SliverFixedExtentList(
                itemExtent: 150.0,
                delegate: SliverChildListDelegate(
                  [
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.green),
                    Container(color: Colors.orange),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      */
    );
  }
}
