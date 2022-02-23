import 'package:ecommerce_app/widgets/address_bar.dart';
import 'package:ecommerce_app/widgets/default_back_button.dart';
import 'package:flutter/material.dart';

class ShopsAppBar extends StatelessWidget {
  const ShopsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.start,
      children: [
        DefaultBackButton(),
        AddressBar(),
      ],
    );
  }
}
