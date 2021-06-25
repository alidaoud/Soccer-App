import 'package:flutter/material.dart';
import 'package:soccerapp/constants.dart';
import 'package:soccerapp/models/league.dart';

class HomeTop extends StatelessWidget {
  final double height;
  final Function onViewAllTap;
  final ValueSetter<League> onLeagueTap;
  const HomeTop({Key key, this.height, this.onViewAllTap, this.onLeagueTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _leagues = League.leagues;
    return Container(
      height: height,
      margin: const EdgeInsets.only(left: marginxLarge),
      decoration: BoxDecoration(
        color: BG_TOP_CONTAINER,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusStandard),
          bottomLeft: Radius.circular(radiusStandard),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(marginLarge),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Fixtures",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeLarge,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onViewAllTap,
                  child: Visibility(
                    visible: onViewAllTap != null,
                    child: Text(
                      "View All",
                      style: TextStyle(
                          color: Colors.white30, fontSize: fontSizeStandard),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                // height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _leagues.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        onLeagueTap(_leagues[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: marginLarge,
                        ),
                        width: 55,
                        height: 55,
                        child: Image.asset(_leagues[index].logo),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
