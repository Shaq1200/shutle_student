
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shutle_student/screens/Home/Components/background.dart';


class home extends StatelessWidget {
  static String id = 'home';
  const home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return background(
      child: Center(
      child: Text("Plan your journey!",
        textAlign: TextAlign.center ,
        style: TextStyle(
        color: Color(0xff026609), fontSize: 30.0,
          fontWeight: FontWeight.w500,
      ),),
      ),
      // button: Positioned(
      //   // bottom:size.height*0.3 ,
      //   // right: size.width*0.4,
      //   // bottom:size.height*0.05 ,
      //   // right: size.width*0.1,
      //   // child: FloatingActionButton(
      //   //     backgroundColor: Colors.lightGreen,
      //   //     child: Icon(
      //   //         Icons.arrow_forward,
      //   //       size: 30,
      //   //       color: Colors.black,
      //   //     ),
      //   //     onPressed: (){
      //   //       Navigator.push(context, new MaterialPageRoute(
      //   //           builder: (context)=> pickUp_screen()
      //   //       ));
      //   //     }),
      // )
    );
  }
}


