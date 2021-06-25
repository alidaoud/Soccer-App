import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soccerapp/constants.dart';
import 'package:soccerapp/models/match.dart';

class MatchFixtureItem extends StatelessWidget {
  final int leagueId;
  final SoccerMatch match;
  final ValueSetter<SoccerMatch> onFixtureTap;
  const MatchFixtureItem(
      {Key key, this.match, this.leagueId, this.onFixtureTap})
      : super(key: key);

  static const List<Color> colors = [
    //red
    Color.fromRGBO(217, 9, 36, 0.5),
    //grey
    Color.fromRGBO(105, 105, 105, 0.5),
    //blue
    Color.fromRGBO(80, 117, 240, 0.5),
  ];

  Color get _itemColor {
    switch (leagueId) {
      case 78:
        return colors[0];
      case 140:
      case 203:
        return colors[1];
      default:
        return colors[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    var homeGoal = match.goal.home;
    var awayGoal = match.goal.away;
    if (homeGoal == null) homeGoal = 0;
    if (awayGoal == null) awayGoal = 0;

    return InkWell(
      onTap: () => onFixtureTap(match),
      child: Container(
        height: 70,
        margin: const EdgeInsets.all(marginStandard),
        padding: const EdgeInsets.all(marginStandard),
        decoration: BoxDecoration(
          color: _itemColor,
          borderRadius: BorderRadius.all(
            Radius.circular(radiusStandard),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                match.home.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeSmall,
                ),
              ),
            ),
            CachedNetworkImage(
              width: 36,
              fit: BoxFit.cover,
              imageUrl: match.home.logoUrl,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Expanded(
              child: Text(
                "$homeGoal - $awayGoal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeSmall,
                ),
              ),
            ),
            CachedNetworkImage(
              width: 36,
              fit: BoxFit.cover,
              imageUrl: match.away.logoUrl,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Expanded(
              child: Text(
                match.away.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
