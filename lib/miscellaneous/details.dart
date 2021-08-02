class bus_details{
  final double occupancy;
  final double bus_lat;
  final double bus_lng;
  bus_details({this.occupancy, this.bus_lat, this.bus_lng});

  factory bus_details.fromJson(Map<dynamic,dynamic> json){
    double parser(dynamic source){
      try{
        return double.parse(source.toString());
      } on FormatException{
        return -1;
      }
    }
    return bus_details(
      occupancy: parser(json['Count']),
      bus_lat: parser(json['lat']),
      bus_lng: parser(json['lng']),
    );

  }
}