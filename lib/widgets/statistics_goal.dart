import 'package:flutter/material.dart';

import '../constants.dart';

class GoalStat extends StatelessWidget {
  final int home;
  final int away;
  final int elapsed;

  const GoalStat({Key key, this.home = 0, this.away = 0, this.elapsed = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$elapsed'",
            style: TextStyle(
              fontSize: fontSizeLarge,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "$home - $away",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSizexLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
