import 'dart:convert';

import 'package:http/http.dart';
import 'package:scoreboard/models/match.dart';

class SoccerApi {
  static const baseUrl = "https://v3.football.api-sports.io/";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "c8dbdf71a1df0fe04f17befd35b1c3d6"
  };

  static Future<List<SoccerMatch>> getLeagueMatches(
      int season, int leagueId) async {
    final url = Uri.parse(baseUrl +
        "fixtures?season=${season.toString()}&league=${leagueId.toString()}");
    Response res = await get(url, headers: headers);
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

  static Future<List<SoccerMatch>> getLiveMatches() async {
    final url = Uri.parse(baseUrl + "fixtures?live=all");
    Response res = await get(url, headers: headers);
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
