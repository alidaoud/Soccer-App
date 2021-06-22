import 'package:flutter/material.dart';
import 'package:scoreboard/constants.dart';
import 'package:scoreboard/models/match.dart';
import 'package:scoreboard/screens/statistics/live_match_details.dart';
import 'package:scoreboard/widgets/card_live_match.dart';
import 'package:scoreboard/widgets/no_live_matches.dart';

class LiveMatchesList extends StatelessWidget {
  final Function onTap;
  final List<SoccerMatch> liveMatches;
  LiveMatchesList({Key key, this.liveMatches, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: marginLarge,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Live Matches",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSizeLarge,
                    ),
                  ),
                ),
                Visibility(
                  visible: liveMatches != null,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: fontSizeStandard,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: liveMatches != null && liveMatches.length > 0
                ? Container(
                    // height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: liveMatches.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => LiveMatchDetails(
                                match: liveMatches[index],
                              ),
                            ),
                          ),
                          child: LiveMatchCard(
                            index: index,
                            match: liveMatches[index],
                          ),
                        );
                      },
                    ),
                  )
                : NoLiveMatches(),
          ),
        ],
      ),
    );
  }
}
