import 'package:flutter/material.dart';

import '../constants.dart';

class TeamStat extends StatelessWidget {
  final bool isHome;
  final String logoUrl;
  final String teamName;
  const TeamStat({Key key, this.isHome, this.logoUrl, this.teamName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            isHome ? "Local Team" : "Visitor Team",
            style: TextStyle(
              fontSize: fontSizeStandard,
            ),
          ),
          SizedBox(
            height: marginStandard,
          ),
          Expanded(
            child: Image.network(
              logoUrl,
              width: 54.0,
            ),
          ),
          SizedBox(
            height: marginStandard,
          ),
          Text(
            teamName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSizeStandard,
            ),
          ),
        ],
      ),
    );
  }
}
