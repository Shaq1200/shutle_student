import 'package:flutter/material.dart';
import 'package:shutle_student/screens/Destination/destination_screen.dart';

class pickUp_screen extends StatefulWidget {
  static String id = 'pickUp_screen';

  const pickUp_screen({key}) : super(key: key);

  @override
  _pickUp_screenState createState() => _pickUp_screenState();
}

class _pickUp_screenState extends State<pickUp_screen> {
  double pick_lat, pick_lng;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children:<Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.yellow,Colors.green,Colors.lightGreen,Colors.yellowAccent]
                ),
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20,
                    bottom: 10
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: size.height*0.2,
                      maxWidth: size.width*0.4,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/pickUp.png")
                        )
                    ),
                  ),
                ),
                Text("Pick-up Location",style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 18,
                ),),

                Padding(
                  padding: EdgeInsets.only(top:size.height*0.05,
                    left: size.width*0.05,
                    right: size.width*0.05,
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: size.height*0.6
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(borderOnForeground: true,
                              color: Colors.white12,
                              child: ListTile(enableFeedback: true,
                                focusColor: Colors.red,
                                title: Text('Pharmacy',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                                onTap: (){
                                setState(() {
                                  pick_lat = 6.674651;
                                  pick_lng = -1.567447;
                                });
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (context) => destination_screen(pick_lat: pick_lat,pick_lng: pick_lng,)
                                )
                                );
                                },
                              ),
                            ),
                            Card(
                              color: Colors.white12,
                              child: ListTile(
                                title: Text('Casely Hayford',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),


                              ),
                            ),
                            Card(
                              color: Colors.white12,
                              child: ListTile(
                                title: Text('Business School',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.white12,
                              child: ListTile(
                                title: Text('Hall 7',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.white12,
                              child: ListTile(
                                title: Text('Brunei',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.white12,
                              child: ListTile(
                                title: Text('Commercial Area',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.white12,
                              child: ListTile(
                                title: Text('Library',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 35,
              left: -10,
              child: RawMaterialButton(
                elevation: 2.0,
                  fillColor: Colors.transparent,
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_back, color: Colors.black,),
                  onPressed: (){
                  Navigator.pop(context);
                  }),
            )
          ]
      ),
    );
  }
}