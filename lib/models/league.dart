class League {
  int id;
  String name;
  String logo;
  String cover;

  League(this.id, this.name, this.logo, this.cover);
  League.fromServer(this.id, this.name, this.logo);

  factory League.fromJson(Map<String, dynamic> json) {
    return League.fromServer(json['id'], json['name'], json['logo']);
  }
  static List<League> leagues = [
    League(2, "Champions League", "assets/images/Champions_League.png",
        "assets/images/champions-league_cover.jpeg"),
    League(140, "Laliga", "assets/images/laliga.png",
        "assets/images/lalig_cover.png"),
    League(78, "Bundesliga", "assets/images/bundesliga.png",
        "assets/images/bundesliga_cover.jpeg"),
    League(39, "Premier League", "assets/images/premier-league.png",
        "assets/images/premier-league_cover.png"),
    League(203, "Superlig", "assets/images/superlig.png",
        "assets/images/superlig_cover.jpeg"),
  ];
}
