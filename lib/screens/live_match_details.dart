import 'package:flutter/material.dart';
import 'package:soccerapp/constants.dart';
import 'package:soccerapp/models/match.dart';
import 'package:soccerapp/screens/background.dart';
import 'package:soccerapp/screens/statistics/components/team.dart';
import 'package:soccerapp/widgets/item_live_detail.dart';

class LiveMatchDetails extends StatefulWidget {
  final SoccerMatch match;
  const LiveMatchDetails({Key key, this.match}) : super(key: key);

  @override
  _LiveMatchDetailsState createState() => _LiveMatchDetailsState();
}

class _LiveMatchDetailsState extends State<LiveMatchDetails> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_PRIMARY,
        title: Text("Live Match Details"),
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
                  child: Column(
                    children: [
                      //Live badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: COLOR_GREEN_LIGHT),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Live",
                          style: TextStyle(color: COLOR_GREEN_LIGHT),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TeamLogoName(
                            isHome: true,
                            width: _size.width * 0.2,
                            team: widget.match.home,
                          ),
                          Container(
                            width: _size.width * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.match.goal.home.toString(),
                                  style: TextStyle(
                                      fontSize: fontSizexxLarge,
                                      color: Colors.white),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: fontSizexxLarge,
                                      color: Colors.white),
                                ),
                                Text(
                                  widget.match.goal.away.toString(),
                                  style: TextStyle(
                                      fontSize: fontSizexxLarge,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          TeamLogoName(
                            isHome: false,
                            width: _size.width * 0.2,
                            team: widget.match.away,
                          ),
                        ],
                      ),
                      Text(
                        "Time: ${widget.match.fixture.status.elapsedTime.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              //statistics list
              Expanded(
                child: ListView(
                  children: [
                    LiveDetailItem(
                      image: IMG_LEAGUE,
                      title: "League",
                      subTitle: widget.match.league.name ?? "N/A",
                    ),
                    LiveDetailItem(
                      image: IMG_VENUE,
                      title: "Venue",
                      subTitle: widget.match.fixture.venue.name ?? "N/A",
                      subTitle2: widget.match.fixture.venue.city ?? "N/A",
                    ),
                    LiveDetailItem(
                      image: IMG_CLOCK,
                      title: "Status",
                      subTitle: widget.match.fixture.status.long ?? "N/A",
                    ),
                    LiveDetailItem(
                      image: IMG_REFEREE,
                      title: "Referee",
                      subTitle: widget.match.fixture.referee ?? "N/A",
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
