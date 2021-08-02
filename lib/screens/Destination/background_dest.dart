import 'package:flutter/material.dart';

class background_dest extends StatelessWidget {
  final Widget child;
  const background_dest({
    Key key, @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/destination.png"),
                          fit: BoxFit.cover)),
                ),
                child,
              ]
          )
      ),
    );
  }
}