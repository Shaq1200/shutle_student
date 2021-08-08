import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class mapScreen_new extends StatefulWidget {
  static String id = 'map_screen_new';
  final double pick_lat, pick_lng;
  final String destination;

  const mapScreen_new({key, this.pick_lat, this.pick_lng, this.destination})
      : super(key: key);

  @override
  _mapScreen_newState createState() => _mapScreen_newState(
        pick_lat: this.pick_lat,
        pick_lng: this.pick_lng,
        destination: this.destination,
      );
}

class _mapScreen_newState extends State<mapScreen_new> {
  double pick_lat;
  double pick_lng;
  String destination;
  LatLng pickUp_location;

  final ref = FirebaseDatabase.instance.reference();

  _mapScreen_newState({this.pick_lat, this.pick_lng, this.destination});
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    readData();

  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/Pin.png');
    busLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/bus.png');
  }

  @override
  GoogleMapController mapController;

  static final CameraPosition _default = CameraPosition(
    target: LatLng(6.674704, -1.571298),
    zoom: 15,
    tilt: 80,
  );

  Map<MarkerId, Marker> markers ={};
  Map<PolylineId,Polyline> polylines ={};
  List<LatLng> polylineCoordinates =[];
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor pinLocationIcon;
  BitmapDescriptor busLocationIcon;
  double _iniLat;
  double _iniLng;
  PointLatLng _iniDriver;
  PointLatLng _pickLocation;
  String peopleCount="8";
  String busType="Brunei";
  String eta="0 min";
  String distance="0 km";
  static const String apiKey = 'AIzaSyBmM84crn9PX3tybAv5MISVGn8W6VVfSmc';


  //read inital point from database
  void readData() async {
    ref.child("TestDriver1").once().then((DataSnapshot dataSnapshot) async {
      var keys = await dataSnapshot.value.keys;
      var values = await dataSnapshot.value;
      print(values);
      for (var key in keys) {
        print(key);
        if (key == 'lat'){
          _iniLat =values[key];
        }
        else if(key == 'lng'){
          _iniLng= values[key];
        }
        else if (key == 'Type'){
          busType =values[key];
        }
        else if (key == 'Count'){
          peopleCount =values[key];
        }
      }
      _iniDriver =PointLatLng(_iniLat, _iniLng);
      _addMarker(LatLng(_iniLat, _iniLng), 'Driver Location', busLocationIcon,);
      _pickLocation =PointLatLng(pick_lat, pick_lng);
      _addMarker(LatLng(pick_lat, pick_lng), 'Pick-up Location', pinLocationIcon,);
      _getPolyline(_iniDriver,_pickLocation);
    }
    );
  }


  _addMarker(LatLng position, String id, BitmapDescriptor descriptor,)async{
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers[markerId] =marker;
    // setState((){
    // });

  }

  _addPolyline(){
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
    );
    polylines[id] =polyline;
    setState(() {
    });
  }
  _getPolyline(PointLatLng _iniDriver, PointLatLng _pickLocation)async{
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(apiKey,
      _iniDriver, _pickLocation,
      //     travelMode: TravelMode.driving,
      // wayPoints: [PolylineWayPoint(location: "Pharmacy to School of Business")]
    );
    if (result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude,point.longitude)) ;
      });
    }
    _addPolyline();
    print(result.points);
  }

  Stream<DataSnapshot> getMapData() {
    return ref.onChildChanged.map<DataSnapshot>((event) {
      DataSnapshot snap = event.snapshot;


      setState(() {
        Set<Marker>.of(markers.values);
        CameraPosition cPosition = CameraPosition(
          zoom: 16,
          tilt: 80,
          target: LatLng(snap.value['lat'],snap.value['lng']),
        );
        mapController.animateCamera(CameraUpdate.newCameraPosition(cPosition));
      });
      return event.snapshot;
    });
  }
  // Future<bool> rebuild() async {
  //   if (!mounted) return false;
  //
  //   // if there's a current frame,
  //   if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
  //     // wait for the end of that frame.
  //     await SchedulerBinding.instance.endOfFrame;
  //     if (!mounted) return false;
  //   }
  //
  //
  //   return true;
  // }

  Future calcEta(double pickLat,double pickLng,double destLat, double destLng) async {
    String url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$pickLat,$pickLng&destinations=$destLat,%20$destLng&key=AIzaSyBmM84crn9PX3tybAv5MISVGn8W6VVfSmc";
        http.Response response = await http.get(Uri.parse(url));
    Map values = jsonDecode(response.body);
    eta = values["rows"][0]["elements"][0]["duration"]["text"];
    distance = values["rows"][0]["elements"][0]["distance"]["text"];
  }
  // Future calcDistance(double pickLat,double pickLng,double destLat, double destLng) async {
  //   double pickLat;
  //   double pickLng;
  //   double destLat;
  //   double destLng;
  //   String url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$pickLat,$pickLng&destinations=$destLat,$destLng&key=AIzaSyBmM84crn9PX3tybAv5MISVGn8W6VVfSmc";
  //   http.Response response = await http.get(Uri.parse(url));
  //   Map values = jsonDecode(response.body);
  //   distance = values["rows"][0]["elements"][0]["distance"]["text"];
  //
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
      SafeArea(
      child: GoogleMap(
      initialCameraPosition: _default,
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;

      },
      trafficEnabled: false,
      markers: Set<Marker>.of(markers.values),
      polylines: Set<Polyline>.of(polylines.values),
      ),
    ),
          StreamBuilder<DataSnapshot>(
              stream: getMapData(),
              builder: (context, snap) {
                if (snap.hasData) {
                  _addMarker(LatLng(snap.data.value['lat'], snap.data.value['lng']),
                      'Driver Location', busLocationIcon,);
                  // print(markers);
                  peopleCount = snap.data.value['Count'];
                  busType = snap.data.value['Bus Type'].toString();
                  calcEta(pick_lat, pick_lng, snap.data.value['lat'], snap.data.value['lng']);
                  // calcDistance(pick_lat, pick_lng, snap.data.value['lat'], snap.data.value['lng']);
                  // create a new CameraPosition instance
                  // every time the location changes, so the camera
                  // follows the pin as it moves with an animation

                  // markers.add(
                  //   Marker(
                  //     markerId: MarkerId('Driver'),
                  //     position: LatLng(snap.data.value['lat'], snap.data.value['lng']),
                  //     icon: busLocationIcon,
                  //   ),
                  // );
                }
                return Container(
                  margin: EdgeInsets.only(top: size.height*0.04, left: size.width*0.2),
                  constraints: BoxConstraints(
                    maxHeight: size.height*0.08,
                    maxWidth: size.width*0.65,
                    minWidth: size.width*0.5,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color:Colors.green),
                      color: Colors.white30.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(23)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("ETA: $eta"),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                        Text("Distance: $distance")
                      ],
                    ),
                  ),

                );
              }),
          Positioned(
            left: size.width*-0.04,
              top: size.height*0.05,
              child: RawMaterialButton(
                elevation: 2.0,
                fillColor: Colors.white,
                shape: CircleBorder(),
                child: Icon(Icons.chevron_left, size: 30,color: Colors.black,
                ),
                  onPressed: (){
                    Navigator.pop(context);
                  })
          )
        ],
      ),
      bottomSheet: SolidBottomSheet(
       maxHeight: size.height*0.13,
          headerBar: Container(
            margin: EdgeInsets.only(left: size.width*0.01, right: size.width*0.01),
            height: size.height*0.08,
            decoration: BoxDecoration(
              color: Color(0xff60d15c),
              // border: Border.all(
              //     color: Colors.black
              // ),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Center(
              child:Text(
                'Bus Details', style: TextStyle(
                fontSize: 20,fontStyle: FontStyle.italic
              ),
              ),
            ) ,
          ),
          body: Container(

            margin: EdgeInsets.only(left: 5, right: 5),
            constraints: BoxConstraints(
              minWidth: size.width*0.99
            ),
            decoration: BoxDecoration(
                color: Colors.white30.withOpacity(0.5)
            ),
            child:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 2.0,
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: size.height*0.8,
                          maxWidth: size.width*0.25
                        ),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0,left: 5.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.where_to_vote,color: Colors.black,),
                                    Text("Status",
                                      style: TextStyle(
                                          fontSize: 18
                                      ),),
                                  ],
                                ),
                                Text("Active",
                                  style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8, right: 8),
                  //   child: Divider(thickness: .5,
                  //     color: Colors.black,),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Card(
                      elevation: 2.0,
                      child: Container(
                        constraints: BoxConstraints(
                            maxHeight: size.height*0.8,
                            maxWidth: size.width*0.3
                        ),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0,left: 5.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.airport_shuttle
                                    ),
                                    // SizedBox(
                                    //   width: 5,
                                    // ),
                                    Text("Bus Type",
                                      style: TextStyle(
                                          fontSize: 18,
                                      ),),
                                  ],
                                ),
                                Text("$busType",
                                  style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Card(
                      elevation: 2.0,
                      child: Container(
                        constraints: BoxConstraints(
                            maxHeight: size.height*0.8,
                            maxWidth: size.width*0.4
                        ),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0,left: 5.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.airline_seat_recline_extra_sharp),
                                    Text("Occupancy",
                                      style: TextStyle(
                                          fontSize: 18,
                                      ),),
                                  ],
                                ),
                                Text("$peopleCount/30",
                                  style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
