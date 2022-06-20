import 'dart:io';

import 'package:trippo/Models/placeModel.dart';

class TripModel {
  late int id;
  late String trip_name;
  late String trip_start;
  late String trip_end;
  late int duration;
  late String trip_plane;
  late String trip_status;
  late int price;
  late int available_num_passenger;
  late String note;
  late String photo;
  late List<PlaceModel> places;
  late File userfile;

  TripModel(
      this.trip_name,
      this.trip_start,
      this.trip_end,
      this.duration,
      this.trip_plane,
      this.trip_status,
      this.price,
      this.available_num_passenger,
      this.note,
      this.userfile
      //this.places
      );

  TripModel.fromJson(Map<String, dynamic> json) {
    id = json['trip_id'];
    trip_name = json['trip_name'];
    trip_start = json['trip_start'];
    trip_end = json['trip_end'];
    duration = json['duration'];
    trip_plane = json['trip_plane'];
    trip_status = json['trip_status'];
    price = json['price'];
    available_num_passenger = json['available_num_passenger'];
    note = json['note'];
    photo = json['photo'];
    if (json['places'] != null) {
      places = <PlaceModel>[];
      (json['places'] as List).forEach((element) {
        places.add(PlaceModel.fromJson(element));
        ////!
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['Places'] = List<PlaceModel>.from(places.map((e) => e.toJson()));

    return data;
  }
}
