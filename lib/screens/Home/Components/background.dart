import 'package:flutter/material.dart';
import 'package:shutle_student/screens/pick_Up/pick_upScreen.dart';

class background extends StatelessWidget {
  final Widget child;

  const background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 2.0,
        backgroundColor: Colors.lightGreen,
          hoverColor: Colors.grey,
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
                builder: (context)=> pickUp_screen()));
          },
          // icon: Icon(
          //   Icons.arrow_forward, size: 30, color: Colors.black,
          // ),
      label: Icon(Icons.arrow_forward),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:Container(
        height: size.height,
        width: size.width,
        child: Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.yellow,Colors.green,Colors.lightGreen,Colors.yellowAccent],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)
                    ),
              ),
              Positioned(
                top: size.height*0.05,
                left: size.width*0.125,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width*0.7,
                    maxHeight: size.height*0.3,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/homepic.png"))
                  ),
                ),
              ),
              // Positioned(
              //   top: size.height*0.01,
              //   left: size.width*0.01,
              //   child: Text('Shuttle App',
              //     style: TextStyle(
              //         fontSize: 30, color: Colors.black,
              //         fontWeight: FontWeight.w500
              //     ),),
              // ),
              child,
            ]

        ),
      ),

    );
  }
}