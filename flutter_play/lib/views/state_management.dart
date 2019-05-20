import 'package:flutter/material.dart';

class StateManagement extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _StateManagementState();
  }
  
}

class _StateManagementState extends State<StateManagement> {

  bool _active$b = false;
  bool _active$c = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('State Management'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tap box A',
                ),
                SizedBox(height: 8),
                TapBoxA(),
                SizedBox(height: 8),
                Text(
                  'Tap box B',
                ),
                SizedBox(height: 8),
                TapBoxB(
                  active: _active$b,
                  onTap: ($value) {
                    setState(() {
                      _active$b = !_active$b;
                    });
                  },
                ),
                SizedBox(height: 8),
                Text(
                  'Tap box C',
                ),
                SizedBox(height: 8),
                TapBoxC(
                  active: _active$c,
                  onTap: ($value) {
                    setState(() {
                      _active$c = !_active$c;
                    });
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

}

class TapBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TapBoxAState();
  }
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        color: _active ? Colors.green : Colors.grey,
        child: Center(
          child: Text(_active ? 'Active' : 'Inactive'),
        ),
      ),
      onTap: _handleTap,
    );
  }
}

class TapBoxB extends StatelessWidget {

  final bool active;
  final ValueChanged<bool> onTap;

  TapBoxB({
    this.active,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        color: active ? Colors.green : Colors.grey,
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
          ),
        ),
      ),
      onTap: () {
        onTap(!active);
      },
    );
  }

}

class TapBoxCParent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TapBoxCParentState();
  }

}

class _TapBoxCParentState extends State<TapBoxCParent> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(),
    );
  }

}

class TapBoxC extends StatefulWidget {
  final ValueChanged<bool> onTap;
  final bool active;

  TapBoxC({
    this.onTap,
    this.active,
  });

  @override
  State<StatefulWidget> createState() {
    return _TapBoxCState();
  }
  
}

class _TapBoxCState extends State<TapBoxC> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(!widget.active);
      },
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive'),
        ),
        decoration: BoxDecoration(
          color: widget.active ? Colors.green : Colors.grey,
          border: _isTapped ?
            Border.all(
              color: widget.active ? Colors.green[900] : Colors.grey[900],
              width: 5) :
            null,
        ),
        width: 100,
        height: 100,
      ),
    );
  }

}