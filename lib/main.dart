
import 'package:flutter/material.dart';
import 'package:shutle_student/screens/Destination/destination_screen.dart';
import 'package:shutle_student/screens/Home/home.dart';
import 'package:shutle_student/screens/map_screen/mapScreen_new.dart';
import 'package:shutle_student/screens/pick_Up/pick_upScreen.dart';
import 'package:shutle_student/screens/splashScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student-side App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,


      ),
      home: splashScreen(),
      routes: {
        home.id :(context) => home(),
        pickUp_screen.id: (context) => pickUp_screen(),
        destination_screen.id: (context) => destination_screen(),
        mapScreen_new.id:(context) => mapScreen_new(),
        splashScreen.id:(context) => splashScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


