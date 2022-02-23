import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/item_details/widgets/single_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsBody extends StatelessWidget {
  const OptionsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.read<CartProvider>().currentItem!;
    return Column(
      children: [
        ...item.itemOptions.map(
              (e) => SingleOption(listOfsom: e.productOptionsList, title: e.name),
        ),
      ],
    );
  }
}

