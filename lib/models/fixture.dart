import 'package:soccerapp/models/status.dart';
import 'package:soccerapp/models/venue.dart';

class Fixture {
  int id;
  String date;
  String referee;
  Status status;
  Venue venue;
  Fixture(this.id, this.date, this.referee, this.status, this.venue);

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(json['id'], json['date'], json['referee'],
        Status.fromJson(json['status']), Venue.fromJson(json['venue']));
  }
}
