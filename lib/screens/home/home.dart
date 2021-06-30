import 'package:flutter/material.dart';
import 'package:soccerapp/api/soccer_api.dart';
import 'package:soccerapp/constants.dart';
import 'package:soccerapp/models/match.dart';
import 'package:soccerapp/screens/background.dart';
import 'package:soccerapp/screens/league_fixtures.dart';
import 'package:soccerapp/screens/league_teams.dart';
import 'package:soccerapp/screens/home/components/home_bottom.dart';
import 'package:soccerapp/screens/home/components/home_top.dart';
import 'package:soccerapp/screens/home/components/list_live_matches.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

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
                  onViewAllTap: null,
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
                      if (snapshot.connectionState == ConnectionState.active ||
                          snapshot.connectionState == ConnectionState.waiting) {
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
                  onViewAllTap: null,
                  onLeagueTap: (league) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => LeagueTeams(league: league),
                      ),
                    );
                  },
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
