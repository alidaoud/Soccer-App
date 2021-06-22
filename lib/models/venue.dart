class Venue {
  int id;
  String name;
  String city;
  Venue(this.id, this.name, this.city);

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(json['id'], json['name'], json['city']);
  }
}
