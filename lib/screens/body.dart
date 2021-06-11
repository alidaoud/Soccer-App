import 'package:flutter/material.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/widgets/matchstat.dart';
import 'package:scoreboard/widgets/matchtile.dart';
import 'package:scoreboard/widgets/statistics_goal.dart';

class PageBody extends StatelessWidget {
  final List<SoccerMatch> allMatches;
  const PageBody({Key key, this.allMatches}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var topMatch = allMatches[0];
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TeamStat(
                    isHome: true,
                    logoUrl: topMatch.home.logoUrl,
                    teamName: topMatch.home.name,
                  ),
                  GoalStat(
                    elapsed: topMatch.fixture.status.elapsedTime,
                    home: topMatch.goal.home,
                    away: topMatch.goal.away,
                  ),
                  TeamStat(
                    isHome: false,
                    logoUrl: topMatch.away.logoUrl,
                    teamName: topMatch.away.name,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF4373D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "MATCHES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allMatches.length,
                      itemBuilder: (context, index) {
                        return matchTile(allMatches[index]);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
