import 'package:flutter/material.dart';
import 'package:shutle_student/screens/map_screen/mapScreen_new.dart';


class destination_screen extends StatefulWidget {
  static String id = 'destinationScreen';
  final double pick_lat, pick_lng;
  const destination_screen({key, this.pick_lat, this.pick_lng}) : super(key: key);

  @override
  _destination_screenState createState() => _destination_screenState(
    pick_lat: this.pick_lat,
    pick_lng: this.pick_lng,
  );
}

class _destination_screenState extends State<destination_screen> {
//pick_up location from pick_up page
  double pick_lat;
  double pick_lng;
  _destination_screenState({this.pick_lat, this.pick_lng});
  //destination coordinates
  String destination;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children:<Widget>[
            Container(
              color: Colors.white,
              constraints: BoxConstraints.expand(),
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
                            image: AssetImage("assets/destPic.png")
                        )
                    ),
                  ),
                ),
                Text("Where to?",style: TextStyle(
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
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(borderOnForeground: true,
                              color: Colors.green,
                              elevation: 2.0,
                              child: ListTile(enableFeedback: true,
                                focusColor: Colors.red,
                                title: Text('Pharmacy',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),onTap: (){
                                setState(() {
                                  destination = 'Pharmacy';
                                });
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (context)=> mapScreen_new(pick_lng: pick_lng,pick_lat: pick_lat,destination: destination,)
                                )
                                );
                                },
                              ),
                            ),
                            Card(
                              color: Colors.green,
                              child: ListTile(
                                title: Text('Casely Hayford',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.green,
                              child: ListTile(
                                title: Text('Business School',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.green,
                              child: ListTile(
                                title: Text('Hall 7',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.green,
                              child: ListTile(
                                title: Text('Brunei',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.green,
                              child: ListTile(
                                title: Text('Commercial Area',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16)
                                  ,),
                              ),
                            ),
                            Card(
                              color: Colors.green,
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
                  fillColor: Color(0xff77fc03),
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


