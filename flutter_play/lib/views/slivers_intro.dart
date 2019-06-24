import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

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
  ScrollController scrollController;
  TabController tabController;

  makeHeader(String headerText) {
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

  makeSliverHeader(String headerText, {bool primary: false}) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        child: Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text(
            headerText,
          ),
        ),
        minHeight: 64,
        maxHeight: 128,
      ),
      // pinned: true,
      // floating: true,
    );
    // return SliverAppBar(
    //   primary: primary,
    //   title: Text(headerText),
    // );
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: CustomScrollView(
            dragStartBehavior: DragStartBehavior.start,
            controller: scrollController,
            slivers: <Widget>[
              makeSliverHeader('Header 1', primary: true),
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
              makeSliverHeader('Header 2'),
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
              makeSliverHeader('Header 3'),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= 5) return null;
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
                        color: getRandomColor());
                  },
                ),
              ),
              new SliverStickyHeader(
                header: new Container(
                  height: 60.0,
                  color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    'Header #0',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (context, i) => new ListTile(
                          leading: new CircleAvatar(
                            child: new Text('0'),
                          ),
                          title: new Text('List tile #${i + 1}'),
                        ),
                    childCount: 10,
                  ),
                ),
              ),
              new SliverStickyHeaderBuilder(
                builder: (context, state) => new Container(
                      height: 60.0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: (state.isPinned ? Colors.pink : Colors.lightBlue)
                          .withOpacity(1.0 - state.scrollPercentage),
                        boxShadow: [
                          BoxShadow(
                            color: state.isPinned ? Colors.black.withOpacity(0.5) : Colors.transparent,
                            blurRadius: 3,
                            spreadRadius: 0,
                            offset: Offset.fromDirection(pi / 2, 2)
                          ),
                        ]
                      ),
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        'Header #1',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (context, i) => new ListTile(
                          leading: new CircleAvatar(
                            child: new Text('0'),
                          ),
                          title: new Text('List tile #$i'),
                        ),
                    childCount: 4,
                  ),
                ),
              ),
              new SliverStickyHeader(
                header: new Container(
                  height: 60.0,
                  color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    'Header #0',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                overlapsContent: true,
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (context, i) => new ListTile(
                          leading: new CircleAvatar(
                            child: new Text('0'),
                          ),
                          title: new Text('List tile #${i + 1}'),
                        ),
                    childCount: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
