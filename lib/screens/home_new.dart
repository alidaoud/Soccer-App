import 'package:flutter/material.dart';
import 'package:scoreboard/api/soccer_api.dart';
import 'package:scoreboard/constants.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/screens/background.dart';
import 'package:scoreboard/screens/league_fixtures.dart';
import 'package:scoreboard/screens/statistics/live_match_details.dart';
import 'package:scoreboard/widgets/home_bottom.dart';
import 'package:scoreboard/widgets/home_top.dart';
import 'package:scoreboard/widgets/list_live_matches.dart';

class HomeNew extends StatelessWidget {
  const HomeNew({Key key}) : super(key: key);

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
                    future: SoccerApi.getLiveMatches(),
                    // future: null,
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

                      final List<SoccerMatch> liveMatches = snapshot.data;
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
