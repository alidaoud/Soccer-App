import 'package:flutter/material.dart';
import 'package:scoreboard/api/soccer_api.dart';
import 'package:scoreboard/constants.dart';
import 'package:scoreboard/models/league.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/screens/background.dart';
import 'package:scoreboard/screens/statistics/match_statistics.dart';
import 'package:scoreboard/widgets/item_match_fixture.dart';

class LeagueFixtures extends StatelessWidget {
  static const ROUTE_NAME = "LeagueFixtures";
  final League league;
  const LeagueFixtures({Key key, @required this.league}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          //background
          TransparentBackground(),
          //main column contains top header and list
          Column(
            children: [
              //top header container
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radiusStandard),
                  bottomRight: Radius.circular(radiusStandard),
                ),
                child: Container(
                  height: _size.height * 0.27,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          league.cover,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      ),
                      Positioned(
                        top: _topPadding,
                        left: marginLarge,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: SoccerApi.getLeagueMatches(2020, league.id),
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

                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("No Fixtures for the current league !"),
                      );
                    }

                    final List<SoccerMatch> leagueFixtures = snapshot.data;
                    return ListView.builder(
                      itemCount: leagueFixtures.length,
                      itemBuilder: (ctx, index) {
                        return MatchFixtureItem(
                          leagueId: league.id,
                          match: leagueFixtures[index],
                          onFixtureTap: (match) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (builder) => MatchStatistics(
                                  match: match,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
