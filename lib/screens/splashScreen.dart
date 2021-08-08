import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shutle_student/screens/Home/home.dart';

class splashScreen extends StatefulWidget {
  static String id = 'splash Screen';
  const splashScreen({key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState(){
     super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=> home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height*0.2,
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: size.height*0.3,
                maxWidth: size.width*0.6,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/splash.png"),
                )
              ),
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            Text("SHUTTLE TRACKING APP", style: TextStyle(
                color: Color(0xff005c29), fontWeight: FontWeight.bold,
              fontSize: 30
            ),),
            SizedBox(
              height: size.height*0.3,
            ),

            Container(
              constraints: BoxConstraints(
                minWidth: size.width*0.2,
                minHeight: size.width*0.2
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage("assets/knust.png")
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
