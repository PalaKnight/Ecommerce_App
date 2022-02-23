import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/items.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/item_details/Item_details.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    context.read<CartProvider>().currentItem = item;
    return GestureDetector(
      onTap: () {
        showBarModalBottomSheet(
          expand: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (ctx) => ItemDetailsScreen(),
        );
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: getProportionateScreenHeight(96),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Spacer(),
                    Text(
                      '${item.price} JD',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                    Spacer(),
                    SizedBox(
                      height: 96,
                      width: 96,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        child: Image.network(
                          item.imageURL.isEmpty
                              ? 'https://media.istockphoto.com/photos/paper-coffee-cup-and-lid-isolated-on-white-picture-id1165889671?k=6&m=1165889671&s=612x612&w=0&h=2FWtF4t0FOhfIuDJTJujGcbuYywRMMxzczPIywgLzXU='
                              : item.imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              ],
            ),
          ),
          Divider(),
        ],
      )
    );
  }
}
