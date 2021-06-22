import 'package:flutter/material.dart';
import 'package:scoreboard/constants.dart';

class StatisticRow extends StatelessWidget {
  final dynamic home;
  final dynamic away;
  final String title;
  final bool isPercentage;
  const StatisticRow(
      {Key key, this.home, this.away, this.title, this.isPercentage = false})
      : super(key: key);

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
            isPercentage ? home.toString() + "%" : home.toString(),
          ),
          Expanded(
            child: Center(
              child: Text(title),
            ),
          ),
          Text(
            isPercentage ? away.toString() + "%" : home.toString(),
          ),
        ],
      ),
    );
  }
}
