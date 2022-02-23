class Shop{
  String id;
  double distance;
  String name;
  String logoURL;
  String details;
  bool isRoasted;

  Shop({
    required this.id,
    required this.details,
    required this.name,
    required this.distance,
    required this.isRoasted,
    required this.logoURL
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      distance: json ['distance'],
      name: json['name'],
      logoURL: json['logoURL'],
      details: json['details'],
      isRoasted: json['isRoasted'],
    );
  }
}