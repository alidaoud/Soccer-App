import 'package:flutter/material.dart';
import 'package:scoreboard/api/soccer_api.dart';
import 'package:scoreboard/constants.dart';
import 'package:scoreboard/models/league.dart';
import 'package:scoreboard/models/team.dart';
import 'package:scoreboard/models/team_info.dart';
import 'package:scoreboard/models/venue.dart';
import 'package:scoreboard/screens/background.dart';
import 'package:scoreboard/widgets/item_team_info.dart';

class LeagueTeams extends StatefulWidget {
  static const ROUTE_NAME = "LeagueTeams";
  final League league;
  const LeagueTeams({Key key, @required this.league}) : super(key: key);

  @override
  _LeagueTeamsState createState() => _LeagueTeamsState();
}

class _LeagueTeamsState extends State<LeagueTeams> {
  int season = 2020;

  final teamInfo = TeamInfo(
    Team(1, "name", "https://media.api-sports.io/football/teams/529.png",
        "country", true, false),
    Venue(
      0,
      "https://media.api-sports.io/football/venues/1462.png",
      "Camp",
      "city",
      "address",
      1111,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _topPadding = MediaQuery.of(context).padding.top;
    print("League Id:: ${widget.league.id}");
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
                          widget.league.cover,
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
              Padding(
                padding: const EdgeInsets.all(marginStandard),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Season:"),
                    DropdownButton<int>(
                      hint: Text(season.toString()),
                      // dropdownColor:,
                      items: SEASONS.map((int value) {
                        return new DropdownMenuItem<int>(
                          value: value,
                          child: new Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          season = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: SoccerApi.getLeagueTeams(widget.league.id, season),
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
                        child: Text("No Teams for the current league !"),
                      );
                    }

                    final List<TeamInfo> teams = snapshot.data;
                    return ListView.builder(
                      itemCount: teams.length,
                      itemBuilder: (ctx, index) {
                        return TeamInfoItem(
                          // leagueId: widget.league.id,
                          teamInfo: teams[index],
                        );
                      },
                    );
                  },
                ),
              ),

              // TeamInfoItem2(
              //   teamInfo: teamInfo,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
