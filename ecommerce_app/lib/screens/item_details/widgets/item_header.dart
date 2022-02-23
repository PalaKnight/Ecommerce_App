import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class ItemHeader extends StatelessWidget {
  const ItemHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.read<CartProvider>().currentItem;
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      child: Row(
        children: [
          SizedBox(
          height: 96,
          width: 96,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(10)
            ),
            child: Image.network(
              item!.imageURL.isEmpty
                  ? 'https://keyboardandcoffee.ca/wp-content/uploads/2019/10/coffee-item-3-300x300.png'
                  : item.imageURL,
              fit: BoxFit.cover,
            ),
          ),
        ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w500,
                      color: kGreyTextColor,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Text(
                    '${item.price} JD',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
            ),
          ),
        ]
      ),

    );
  }
}
