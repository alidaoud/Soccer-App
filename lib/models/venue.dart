class Venue {
  int id;
  String image;
  String name;
  String city;
  String address;
  int capacity;
  Venue(this.id, this.image, this.name, this.city, this.address, this.capacity);

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(json['id'], json['image'], json['name'], json['city'],
        json['address'], json['capacity']);
  }
}
