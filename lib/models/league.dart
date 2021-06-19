class League {
  int id;
  String name;
  String image;

  League(this.id, this.name, this.image);

  static List<League> leagues = [
    League(1, "Champions League", "assets/images/Champions_League.png"),
    League(1, "Laliga", "assets/images/laliga.png"),
    League(1, "Bundesliga", "assets/images/bundesliga.png"),
    League(1, "Premier League", "assets/images/premier-league.png"),
    League(1, "Superlig", "assets/images/superlig.png"),
  ];
}
