import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soccerapp/constants.dart';
import 'package:soccerapp/models/match.dart';

class LiveMatchCard extends StatelessWidget {
  final SoccerMatch match;
  final int index;
  const LiveMatchCard({Key key, this.index, this.match}) : super(key: key);

  static List<Color> cardColors = [
    BG_CARD_LIVE_1,
    BG_CARD_LIVE_2,
    BG_CARD_LIVE_3,
    BG_CARD_LIVE_4
  ];

  Color get _cardColor {
    return cardColors[index % 4];
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _cardWidth = _size.width / 2 - marginStandard * 2;
    final _logoWidth = _cardWidth * 0.3 - marginStandard * 2;
    return Container(
      width: _cardWidth,
      margin: const EdgeInsets.symmetric(
        horizontal: marginStandard,
        vertical: marginLarge,
      ),
      padding: const EdgeInsets.all(marginStandard),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: COLOR_GREEN),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Text(
              "Live",
              style: TextStyle(color: COLOR_GREEN),
            ),
          ),
          SizedBox(height: marginxLarge),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //home team container
                Container(
                  width: _cardWidth * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: _logoWidth,
                        margin: const EdgeInsets.only(bottom: marginLarge),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: match.home.logoUrl,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: marginxLarge),
                        child: Text(
                          match.home.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                        ),
                      ),
                      Text(match.goal.home.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  width: marginStandard,
                ),
                //away team container
                Container(
                  width: _cardWidth * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: _logoWidth,
                        margin: const EdgeInsets.only(bottom: marginLarge),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: match.away.logoUrl,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: marginxLarge),
                        child: Text(
                          match.away.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                        ),
                      ),
                      Text(match.goal.away.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
