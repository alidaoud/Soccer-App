class Statistic {
  String type;
  dynamic value;

  Statistic(this.type, this.value);

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(json['type'], json['value']);
  }

  @override
  String toString() {
    return "{type: $type, value: $value}";
  }
}
