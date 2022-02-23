import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/item_option.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionTile extends StatelessWidget {
  const SelectionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemOption>(
      builder: (_, itemOption, __) {
        return Row(
          children: [
            Checkbox(
              value: itemOption.isSelected,
              onChanged: (v) => itemOption.setIsSelected(v!),
              checkColor: Colors.white,
              activeColor: kPrimaryColor,
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(
              itemOption.name,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
            Spacer(),
            Text(
              '${itemOption.price}',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
          ],
        );
      },
    );
  }
}
