import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/item_details/widgets/selection_tile.dart';
import 'package:ecommerce_app/screens/item_details/widgets/single_option.dart';
import 'package:ecommerce_app/screens/item_details/widgets/options_body.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.read<CartProvider>().currentItem!;
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Customize the item',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(17),
                fontWeight: FontWeight.w600,
              ),
            ),
            ItemHeader(),
            SizedBox(
              height: 10,
            ),
            Divider(),
            OptionsBody(),
          ],
        ),
      ),
    );
  }
}
