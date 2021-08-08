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
                      bottom: 5
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
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/pharmacy.jpg?alt=media&token=0e12f0b0-2cea-4771-9994-681ff0613765")
                                    // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                    // ),
                                  )
                              ),
                              child: ListTile(enableFeedback: true,
                                focusColor: Colors.red,
                                title: Text('Pharmacy',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
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
                                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/casley%20Hayford.jpg?alt=media&token=3ea678dd-621f-495d-bb68-500dcd5ba002")
                                    // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                    // ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Casely Hayford',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black,fontWeight:FontWeight.bold
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
                                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/business%20school.jpg?alt=media&token=2ae7e2e7-4681-4566-846f-e80e390df2a3")
                                    // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                    // ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Business School',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
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
                                  //   colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                  //   fit: BoxFit.fitWidth,
                                  //  image: NetworkImage("")
                                  //   // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                  //   // ),
                                  // )
                              ),
                              child: ListTile(
                                title: Text('Hall 7',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
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
                                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/brunei.jpg?alt=media&token=17bcbe3b-b050-41ea-9a49-218cb2f2d959")
                                    // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                    // ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Brunei',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
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
                                  //   colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                  //   fit: BoxFit.fitWidth,
                                  //   image: NetworkImage(""),
                                  //   // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                  //   // ),
                                  // )
                              ),
                              child: ListTile(
                                title: Text('Commercial Area',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
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
                                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/katanga.jpg?alt=media&token=a2652730-bbed-46ff-981e-6ea8947bd133"),
                                    // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                    // ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Katanga',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
                                  ,),
                              ),
                            ),SizedBox(
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
                                    colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.3), BlendMode.dstATop),
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/shuttle-tracker-c2a87.appspot.com/o/library.jpg?alt=media&token=0138f074-b0f6-4335-a3b3-7b8543a4bb5f"),
                                    // image: AssetImage("assets/locations/pharmacy_shuttle.jpg",
                                    // ),
                                  )
                              ),
                              child: ListTile(
                                title: Text('Library',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
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


