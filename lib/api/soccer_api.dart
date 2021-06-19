import 'dart:convert';

import 'package:http/http.dart';
import 'package:scoreboard/models/match.dart';

class SoccerApi {
  final apiUrl = Uri.parse(
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39");

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "c8dbdf71a1df0fe04f17befd35b1c3d6"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: headers);
    List<SoccerMatch> matches = [];

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: $body");
      matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
    }
    return matches;
  }
}
