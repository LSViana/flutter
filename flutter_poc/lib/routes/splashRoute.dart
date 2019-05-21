import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poc/routes/loginRoute.dart';

class SplashRoute extends StatelessWidget {
  void openLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (innerContext) {
          return LoginRoute();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    //
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              child: Image.network(
                'https://pixabay.com/get/57e8d3444c57aa14f6d1867dda6d367c103adae451526c48702a73d0914fc651b1/abstract-1867656_1920.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 28,
                              ),
                              children: [
                                TextSpan(text: 'Explore '),
                                TextSpan(
                                  text: 'Flutter',
                                  style: TextStyle(
                                    color: theme.accentColor,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: FloatingActionButton(
                      child: Icon(Icons.explore),
                      onPressed: () {
                        openLogin(context);
                      },
                    )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
