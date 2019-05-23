import 'package:flutter/material.dart';
import 'package:flutter_poc/core/models/feature.dart';

class FeaturesRoute extends StatefulWidget {

  @override
  State<FeaturesRoute> createState() {
    return _FeaturesRouteState();
  }

}

class _FeaturesRouteState extends State<FeaturesRoute> {
  var features = [
    Feature(
      title: 'Lists',
      subtitle: 'Showing tiles to display data',
      icon: Icons.list,
      imageSrc: 'https://www.jotform.com/blog/wp-content/uploads/2018/08/to-do-list-compressor.jpg',
    ),
    Feature(
      title: 'Take picture',
      subtitle: 'Pictures with the device camera',
      icon: Icons.camera,
      imageSrc: 'https://images6.alphacoders.com/411/411888.jpg',
    ),
  ];

  @override
  initState() {
    super.initState();
  }

  Widget createFeatureDetails(Feature feature, BuildContext context) {
    final theme = Theme.of(context);
    //
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feature.title,
                style: theme.textTheme.display1,
              ),
              Text(
                feature.subtitle,
                style: theme.textTheme.body1,
              ),
            ],
          ),
        ),
        Container(
          child: FloatingActionButton(
            heroTag: feature.title,
            onPressed: () {
              print(feature.title);
            },
            child: Icon(feature.icon),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    //
    return Theme(
      data: ThemeData.dark()
        .copyWith(
          primaryColor: Colors.pink,
          accentColor: Colors.yellow[700],
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Magic Flutter'),
        ),
        body: Container(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: features.map((feature) {
              return Container(
                padding: const EdgeInsets.all(8),
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                child: Container(
                  child: createFeatureDetails(feature, context),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(
                        feature.imageSrc,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      )
    );
  }

}