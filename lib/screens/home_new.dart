import 'package:flutter/material.dart';
import 'package:scoreboard/api/soccer_api.dart';
import 'package:scoreboard/constants.dart';
import 'package:scoreboard/models/goal.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/models/team.dart';
import 'package:scoreboard/screens/background.dart';
import 'package:scoreboard/screens/league_fixtures.dart';
import 'package:scoreboard/widgets/home_bottom.dart';
import 'package:scoreboard/widgets/home_top.dart';
import 'package:scoreboard/widgets/list_live_matches.dart';

class HomeNew extends StatelessWidget {
  const HomeNew({Key key}) : super(key: key);

  static Team realMadrid = Team(
      1,
      "Real Madrid",
      "https://www.logofootball.net/wp-content/uploads/Real-Madrid-CF-Logo.png",
      true);
  static Team barcelona = Team(
      1,
      "barcelona",
      "https://static.wikia.nocookie.net/captaintsubasa/images/e/e2/Barcelona_%28Logo%29.png",
      false);

  static List<SoccerMatch> liveMatches = [
    SoccerMatch(null, realMadrid, barcelona, Goal(3, 2)),
    SoccerMatch(null, realMadrid, barcelona, Goal(3, 2)),
    SoccerMatch(null, realMadrid, barcelona, Goal(3, 2)),
    SoccerMatch(null, realMadrid, barcelona, Goal(3, 2)),
  ];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TransparentBackground(),
            Column(
              children: [
                Container(
                  //app bar
                  height: 50,
                  child: Center(
                    child: Text(
                      "Soccer App",
                      style: TextStyle(
                        color: COLOR_PRIMARY,
                        fontSize: fontSizexLarge,
                      ),
                    ),
                  ),
                ),
                HomeTop(
                  onViewAllTap: () {},
                  onLeagueTap: (league) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => LeagueFixtures(
                          league: league,
                        ),
                      ),
                    );
                  },
                  height: _size.height * 0.22,
                ),
                SizedBox(
                  height: marginLarge,
                ),
                Expanded(
                  child: FutureBuilder(
                    // future: SoccerApi.getLiveMatches(),
                    future: null,
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("An Error occurred !"),
                        );
                      }

                      final liveMatches = snapshot.data;
                      return LiveMatchesList(
                        liveMatches: liveMatches,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: marginLarge,
                ),
                HomeBottom(
                  onViewAllTap: () {},
                  onLeagueTap: (leagueId) {},
                  height: _size.height * 0.22,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
