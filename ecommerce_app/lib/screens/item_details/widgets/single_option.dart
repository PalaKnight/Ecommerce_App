import 'package:ecommerce_app/models/item_option.dart';
import 'package:ecommerce_app/screens/item_details/widgets/selection_tile.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleOption extends StatelessWidget {
  const SingleOption({Key? key, required this.listOfsom, required this.title})
      : super(key: key);
  final String title;
  final List<ItemOption> listOfsom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ...listOfsom.map(
              (e) => ChangeNotifierProvider.value(
            value: e,
            child: SelectionTile(),
          ),
        )
      ],
    );
  }
}
