import 'package:flutter/material.dart';
import 'package:scoreboard/api/soccer_api.dart';
import 'package:scoreboard/constants.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/models/statistic.dart';
import 'package:scoreboard/screens/background.dart';
import 'package:scoreboard/screens/statistics/components/row.dart';
import 'package:scoreboard/screens/statistics/components/team.dart';

class MatchStatistics extends StatefulWidget {
  final SoccerMatch match;
  const MatchStatistics({Key key, this.match}) : super(key: key);

  @override
  _MatchStatisticsState createState() => _MatchStatisticsState();
}

class _MatchStatisticsState extends State<MatchStatistics> {
  List<Statistic> homeStatistics;
  List<Statistic> awayStatistics;
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
    getStatistics();
  }

  void getStatistics() async {
    isLoading = true;
    homeStatistics = await SoccerApi.getTeamStatistics2(
        widget.match.fixture.id, widget.match.home.id);

    awayStatistics = await SoccerApi.getTeamStatistics2(
        widget.match.fixture.id, widget.match.away.id);
    isLoading = false;

    // print("Home:: homestats :: ${homeStatistics.statistics.toList()}");
    // print("Home:: awaystats :: ${awayStatistics.statistics.toList()}");
  }

  set isLoading(bool loading) {
    setState(() {
      _isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _homeStatLength = homeStatistics.length;
    final _awayStatLength = awayStatistics.length;
    final _statLength =
        _homeStatLength >= _awayStatLength ? _awayStatLength : _homeStatLength;
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
                                  fontSize: fontSizeLarge, color: Colors.white),
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                  fontSize: fontSizeLarge, color: Colors.white),
                            ),
                            Text(
                              widget.match.goal.away.toString(),
                              style: TextStyle(
                                  fontSize: fontSizeLarge, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      TeamLogoName(
                        width: _size.width * 0.2,
                        team: widget.match.away,
                      ),
                    ],
                  ),
                ),
              ),
              //statistics list
              Expanded(
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _statLength,
                        itemBuilder: (ctx, index) {
                          return StatisticRow(
                            // home: 2,
                            // away: 3,
                            // title: "tiot",
                            home: homeStatistics[index].value,
                            away: awayStatistics[index].value,
                            title: homeStatistics[index].type,
                          );
                        },
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
