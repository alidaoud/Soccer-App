import 'package:flutter/material.dart';
import 'package:soccerapp/constants.dart';

class StatisticRow extends StatelessWidget {
  final dynamic home;
  final dynamic away;
  final String title;
  const StatisticRow({
    Key key,
    this.home,
    this.away,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: marginLarge,
        vertical: marginStandard,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: marginxLarge,
      ),
      child: Row(
        children: [
          Text(
            home.toString(),
          ),
          Expanded(
            child: Center(
              child: Text(title),
            ),
          ),
          Text(
            away.toString(),
          ),
        ],
      ),
    );
  }
}
