import 'package:flutter/material.dart';
import 'package:scoreboard/constants.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/screens/background.dart';
import 'package:scoreboard/screens/statistics/components/team.dart';

class MatchStatistics extends StatelessWidget {
  final SoccerMatch match;
  const MatchStatistics({Key key, this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_PRIMARY,
        title: Text("Fixture Statistics"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          TransparentBackground(),
          Column(
            children: [
              //top header
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radiusStandard),
                  bottomRight: Radius.circular(radiusStandard),
                ),
                child: Container(
                  padding: const EdgeInsets.all(marginLarge),
                  // height: _size.height * 0.2,
                  width: double.infinity,
                  color: COLOR_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TeamLogoName(
                        width: _size.width * 0.2,
                        team: match.home,
                      ),
                      Container(
                        width: _size.width * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              match.goal.home.toString(),
                              style: TextStyle(
                                  fontSize: fontSizeLarge, color: Colors.white),
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                  fontSize: fontSizeLarge, color: Colors.white),
                            ),
                            Text(
                              match.goal.away.toString(),
                              style: TextStyle(
                                  fontSize: fontSizeLarge, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      TeamLogoName(
                        width: _size.width * 0.2,
                        team: match.away,
                      ),
                    ],
                  ),
                ),
              ),
              //statistics list
              Expanded(
                child: Center(
                  child: Text("Statistics will be here soon"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
