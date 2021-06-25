class Team {
  int id;
  String name;
  String logoUrl;
  String country;
  bool winner;
  bool isNational;
  Team(this.id, this.name, this.logoUrl, this.country, this.winner,
      this.isNational);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logo'], json['country'],
        json['winner'], json['national']);
  }
}
