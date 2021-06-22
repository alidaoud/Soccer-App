import 'dart:convert';

import 'package:http/http.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/models/statistic.dart';

class SoccerApi {
  static const baseUrl = "https://v3.football.api-sports.io/";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "c8dbdf71a1df0fe04f17befd35b1c3d6"
    // 'x-rapidapi-key': "398458e9762fecc01f76c4b3e6debebe"
  };

  static List<dynamic> statisticsList = [];

  static Future<List<SoccerMatch>> getLeagueMatches(
      int season, int leagueId) async {
    final url = Uri.parse(baseUrl +
        "fixtures?season=${season.toString()}&league=${leagueId.toString()}");
    Response res = await get(url, headers: headers);
    List<SoccerMatch> matches = [];

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("getLeagueMatches: $body");
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
      print("getLiveMatches: $body");
      matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();
    }
    return matches;
  }

  static Future<List<Statistic>> getTeamStatistics(
      int fixtureId, int teamId) async {
    print("[SoccerApi] :: getting team statistics for team $teamId..");
    final url = Uri.parse(baseUrl +
        "fixtures/statistics?fixture=${fixtureId.toString()}&team=${teamId.toString()}");
    Response res = await get(url, headers: headers).catchError((error) {
      print(error);
    });

    List<Statistic> statistics = [];

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<dynamic> response = body['response'];

      for (Map<String, dynamic> stat in response.first['statistics']) {
        // print("loop :: ${stat.toString()}");
        try {
          statistics.add(Statistic.fromJson(stat));
        } catch (e) {
          print(e);
        }
      }
      print("stats:: ${statistics.toList()}");
    }
    return statistics;
  }

  //move back to the getTeamStatistics method above in the stable version
  static Future<List<Statistic>> getTeamStatistics2(
      int fixtureId, int teamId) async {
    print("[SoccerApi] :: getTeamStatistics2: called");
    dynamic body;
    final url = Uri.parse(baseUrl +
        "fixtures/statistics?fixture=${fixtureId.toString()}&team=${teamId.toString()}");

    //the data will be stored in static list to prevent making too many requests after the first one => debug purposes
    if (statisticsList.length == 0) {
      print("[SoccerApi] getTeamStatistics2 :: called api");
      Response res = await get(url, headers: headers).catchError((error) {
        print(error);
      });
      body = jsonDecode(res.body);
      statisticsList = body['response'];
    }
    // print("getTeamStatistics: $body");
    // print("response: $response");
    print("response first: ${statisticsList.first}");
    print("response first team : ${statisticsList.first['team']}");
    print("response first stats : ${statisticsList.first['statistics']}");
    print("response first stats 0: ${statisticsList.first['statistics'][0]}");
    print("response 0 stats 0: ${statisticsList[0]['statistics'][0]}");

    List<Statistic> statistics = [];

    for (Map<String, dynamic> stat in statisticsList.first['statistics']) {
      print("loop :: ${stat.toString()}");
      try {
        statistics.add(Statistic.fromJson(stat));
      } catch (e) {
        print(e);
      }
    }

    print("stts: ${statistics.toList()}");

    return statistics;
  }
}
