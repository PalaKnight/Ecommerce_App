

class Section{
  num number;
  String name;
  String imageURL ;
  String id;

  Section({
    required this.number,
    required this.name,
    required this.imageURL,
    required this.id,
});

  factory Section.fromJson(Map<String, dynamic> json){
    return Section(
        number: json['number'],
        name: json['name'],
        imageURL: json['imageURL'],
        id: json['id']
    );
  }
}