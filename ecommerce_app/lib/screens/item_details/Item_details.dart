
import 'package:ecommerce_app/models/items.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/item_details/widgets/body.dart';
import 'package:flutter/material.dart';
class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(
        child: Body(),
      ),
    );
  }
}
