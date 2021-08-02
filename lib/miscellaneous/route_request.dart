
import 'package:http/http.dart' as http;
import 'dart:convert';


class services{
  String eta;
  String distance;
  Future<void> calcEta(double pickLat,double pickLng,double destLat, double destLng) async {
    String url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins={$pickLat},%20{$pickLng}&destinations={$destLat},%20{$destLng}&key=AIzaSyBmM84crn9PX3tybAv5MISVGn8W6VVfSmc";
    http.Response response = await http.get(Uri.parse(url));
    Map values = jsonDecode(response.body);
     eta = values["rows"][0]["elements"][0]["duration"]["text"];
  }
  Future<void> calcDistance(double pickLat,double pickLng,double destLat, double destLng) async {
    double pickLat;
    double pickLng;
    double destLat;
    double destLng;
    String url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$pickLat,%20{$pickLng}&destinations={$destLat},%20{$destLng}&key=AIzaSyBmM84crn9PX3tybAv5MISVGn8W6VVfSmc";
    http.Response response = await http.get(Uri.parse(url));
    Map values = jsonDecode(response.body);
    distance = values["rows"][0]["elements"][0]["distance"]["text"];

  }


}