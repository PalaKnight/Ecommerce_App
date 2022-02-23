import 'package:flutter/material.dart';

class ItemOptions {
  num rank;
  String name;
  bool singleSelection;
  List<ItemOption> productOptionsList;

  ItemOptions({
    required this.name,
    required this.productOptionsList,
    required this.rank,
    required this.singleSelection,
  });

  factory ItemOptions.fromJson(Map<String, dynamic> json) {
    List<ItemOption> io = [];
    if (json['productOptionsList'] != null) {
      for (var x in json['productOptionsList']) {
        io.add(ItemOption.fromJson(x));
      }
    }

    return ItemOptions(
      name: json['name'],
      productOptionsList: io,
      rank: json['rank'],
      singleSelection: json['singleSelection'],
    );
  }
}

class ItemOption with ChangeNotifier {
  String id;
  String name;
  num price;
  num priceToAdd;
  bool isSelected = false;

  ItemOption({
    required this.id,
    required this.name,
    required this.price,
    required this.priceToAdd,
  });
  void setIsSelected(bool v) {
    isSelected = v;
    notifyListeners();
  }

  factory ItemOption.fromJson(Map<String, dynamic> json) {
    return ItemOption(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      priceToAdd: json['priceToAdd'],
    );
  }
}
