import 'package:ecommerce_app/models/sub_category.dart';
import 'package:ecommerce_app/screens/items_screen/widgets/item_tile.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  const ItemsList(
      {
        Key? key,
        required this.subCategory
      }
      ) : super(key: key);

  final SubCategory subCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
              subCategory.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        ...subCategory.items.map((e) => ItemTile(item : e),
        ),
      ],
    );
  }
}
