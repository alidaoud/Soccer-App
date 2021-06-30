import 'dart:convert';

import 'package:http/http.dart';
import 'package:soccerapp/models/match.dart';
import 'package:soccerapp/models/statistic.dart';
import 'package:soccerapp/models/team_info.dart';

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

  static Future<List<TeamInfo>> getLeagueTeams(int leagueId, int season) async {
    print("[SoccerApi] :: getLeagueTeams: called");
    final url = Uri.parse(baseUrl + "teams?league=$leagueId&season=$season");

    Response res = await get(url, headers: headers).catchError((error) {
      print(error);
    });
    print("url:: $url");
    List<TeamInfo> teams = [];

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<dynamic> teamsList = body['response'];
      try {
        teams =
            teamsList.map((dynamic item) => TeamInfo.fromJson(item)).toList();
      } catch (error) {
        print(error);
      }
      print("teams:: ${teams.toList()}");
    }
    return teams;
  }
}
