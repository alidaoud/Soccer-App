import 'package:scoreboard/models/statistic.dart';
import 'package:scoreboard/models/team.dart';

class TeamStatistics {
  Team team;
  List<Statistic> statistics;

  TeamStatistics(this.statistics);

  factory TeamStatistics.fromJson(Map<String, dynamic> json) {
    return TeamStatistics(List<dynamic>.from(
        json["statistics"].map((x) => Statistic.fromJson(x))));
  }

  @override
  String toString() {
    return "team : $team, statistics: ${statistics.toList()}";
  }
}
