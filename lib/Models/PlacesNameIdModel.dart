class PlacesNameIdModel {
  late String place_name;
  late int id;

  PlacesNameIdModel(this.place_name, this.id);
  PlacesNameIdModel.fromJson(Map<String, dynamic> json) {
    place_name = json['place_name'] as String;
    id = json['id'] as int;
  }
}
