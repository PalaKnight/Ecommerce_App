import 'dart:convert';

import 'package:ecommerce_app/models/items.dart';

class SubCategory{
  String id;
  String name;
  List<Item> items;

  SubCategory(
      {
    required this.id,
    required this.name,
    required this.items
  }
  );

  factory SubCategory.fromJson(Map<String, dynamic> json){
    List<Item> tItems =[];
    for (var s in json['products'])
      tItems.add(Item.fromJson(s));

    return SubCategory(id: json['id'], items: tItems, name: json['name']);
  }
  }
