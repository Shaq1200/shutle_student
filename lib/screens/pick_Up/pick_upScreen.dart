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
                color: Colors.white,
                // gradient: LinearGradient(
                //     begin: Alignment.bottomLeft,
                //     end: Alignment.topRight,
                //     colors: [Colors.yellow,Colors.green,Colors.lightGreen,Colors.yellowAccent]
                // ),
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
                Text("Pick-up Locations",style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 19, color: Color(0xff005c29)
                ),),

                Padding(
                  padding: EdgeInsets.only(top:size.height*0.03,
                    left: size.width*0.08,
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: size.height*0.65
                    ),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height*0.15,
                                minHeight: size.height*0.15,
                                maxWidth: size.width*0.8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/pharmacy_shuttle.jpg?alt=media&token=62f00bd6-d2d3-47b2-8dfc-4f4c804d9f69"),
                                  // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                  // ),
                                )
                              ),
                              child: ListTile(enableFeedback: true,
                                focusColor: Colors.red,
                                title: Text('Pharmacy',textScaleFactor: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
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
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height*0.15,
                                minHeight: size.height*0.15,
                                maxWidth: size.width*0.8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/casleyShuttle.jpg?alt=media&token=d0d60631-1576-4bc9-addf-6ae9d831abea",
                                    ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Casely Hayford',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18,
                                  color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  )
                                  ,),


                              ),
                            ),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height*0.15,
                                minHeight: size.height*0.15,
                                maxWidth: size.width*0.8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/business_shuttle.jpg?alt=media&token=9105d53e-9824-42e7-8146-c45a378cdd8e",
                                    ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Business School',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18,
                                  color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )
                                  ,),
                              ),
                            ),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height*0.15,
                                minHeight: size.height*0.15,
                                maxWidth: size.width*0.8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  //TODO: image: DecorationImage(
                              //       colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.3), BlendMode.dstATop),
                              //       fit: BoxFit.fitWidth,
                              //       image: AssetImage("assets/locations/business_shuttle.jpg",
                              //       ),
                              //     )
                              ),

                              child: ListTile(
                                title: Text('Hall 7',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  )
                                  ,),
                              ),
                            ),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height*0.15,
                                minHeight: size.height*0.15,
                                maxWidth: size.width*0.8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/brunei_shuttle.jpg?alt=media&token=e08963fa-ed16-497a-82d3-ac125b9abd3a",
                                    ),
                                  )
                              ),

                              child: ListTile(
                                title: Text('Brunei',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18,
                                  color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  )
                                  ,),
                              ),
                            ),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height*0.15,
                                minHeight: size.height*0.15,
                                maxWidth: size.width*0.8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  // image: DecorationImage(
                                  //   colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.3), BlendMode.dstATop),
                                  //   fit: BoxFit.fitWidth,
                                  //   image: AssetImage("assets/locations/brunei_shuttle.jpg",
                                  //   ),
                                  // )
                              ),
                              child: ListTile(
                                title: Text('Commercial Area',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                  )
                                  ,),
                              ),
                            ),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height*0.15,
                                minHeight: size.height*0.15,
                                maxWidth: size.width*0.8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/library_shuttle.jpg?alt=media&token=8497472a-958f-4660-b339-f59bd20d3846",
                                    ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Library',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                  )
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
                  fillColor: Color(0xff005c29),
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: (){
                  Navigator.pop(context);
                  }),
            )
          ]
      ),
    );
  }
}