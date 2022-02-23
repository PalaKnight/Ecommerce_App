import 'item_option.dart';

class Item {
  String id;
  String shopId;
  String? subCateogoryId;
  String category;
  String name;
  String imageURL;
  String details;
  num price;
  num priceToAdd;
  List<ItemOptions> itemOptions;

  Item({
    required this.category,
    required this.details,
    required this.id,
    required this.imageURL,
    required this.name,
    required this.price,
    required this.priceToAdd,
    required this.shopId,
    required this.subCateogoryId,
    required this.itemOptions,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    List<ItemOptions> io = [];

    if (json['itemsOptions'] != null) {
      for (var x in json['itemsOptions']) {
        io.add(ItemOptions.fromJson(x));
      }
    }

    return Item(
      itemOptions: io,
      category: json['category'],
      id: json['id'],
      shopId: json['shopId'],
      subCateogoryId: json['subCategoryId'],
      name: json['name'],
      price: json['price'],
      priceToAdd: json['priceToAdd'],
      imageURL: json['image'] ?? '',
      details: json['itemDetails'],
    );
  }
}
