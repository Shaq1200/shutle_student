import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class queryScreen extends StatefulWidget {
  static String id = 'query';
  final double pick_lat, pick_lng;
  final String destination;
  const queryScreen({key, this.pick_lat, this.pick_lng, this.destination}) : super(key: key);

  @override
  _queryScreenState createState() => _queryScreenState(
    pick_lat: this.pick_lat,
    pick_lng: this.pick_lng,
    destination: this.destination,
  );
}

class _queryScreenState extends State<queryScreen> {
  double pick_lat;
  double pick_lng;
  String destination;
  _queryScreenState({ this.pick_lat, this.pick_lng, this.destination});
  final ref = FirebaseDatabase.instance.reference();
  List <bus> buses =[];

  @override
  void initState(){
    super.initState();
    queryData();
  }
  
  Future <void> queryData() async{
    ref.orderByChild("Bus Type").equalTo("Brunei").once().then((DataSnapshot snap) async {
      Map<dynamic, dynamic> values = await snap.value;
      values.forEach((key, value) {
        print(value["Bus Id"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 300,
          child: ElevatedButton(onPressed: (){
            print(buses.map((e) => (print(e.lat))));
          },
              child: Text("Press me"),
          ),
        ),
      ),
    );
  }
}

class bus {
  final String busName;
  final double lat;
  final double lng;
  bus({this.busName,this.lat,this.lng});

  Map<String, Object> toMap(){
    return{
      'Bus Name': busName,
      'lat': lat,
      'lng': lng
    };
  }

  static bus fromMap(Map value){
    return bus(
      busName: value['Bus Name'],
      lng:  value['lng'],
      lat: value["lat"]
    );
  }


  @override
  String toString(){
    return 'Bus Name:${busName}, Lat:${lat}, Lng: ${lng}';
  }
}