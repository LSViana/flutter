import 'package:flutter/material.dart';

class MaterialRipples extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MaterialRipplesState();
  }

}

class MaterialRipplesState extends State<MaterialRipples> {

  final dismissibleKey = UniqueKey();
  final items = List<String>
      .generate(20, (value) { return 'Item ${value + 1}'; });

  @override
  Widget build(BuildContext context) {
    final listView = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          key: Key(item),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
            Scaffold
              .of(context)
              .showSnackBar(
                SnackBar(
                  content: Text(
                    '$item dismissed',
                  ),
                )
              );
          },
          child: ListTile(
            title: Text(
              '${items[index]}'
            ),
          ),
        );
      },
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Ripple Text'
              ),
            ),
            onTap: () {
              Scaffold
                .of(context)
                .showSnackBar(SnackBar(
                  action: SnackBarAction(
                    label: 'ACTION',
                    onPressed: () {
                      print('Action invoked');
                    },
                  ),
                  content: Text(
                    'Widget with ripple'
                  ),
                ));
            },
          ),
          MyButton(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text('a', style: TextStyle(backgroundColor: Colors.red)),
            ],
          ),
          Container(
            height: 300,
            color: Colors.red[100],
            child: listView,
          )
        ],
      ),
    );
  }

}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        final snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      // The custom button
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('My Button'),
      ),
    );
  }
}