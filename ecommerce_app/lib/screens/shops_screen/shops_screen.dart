
import 'package:ecommerce_app/providers/shops_provider.dart';
import 'package:ecommerce_app/screens/shops_screen/widgets/body.dart';
import 'package:ecommerce_app/screens/shops_screen/widgets/shops_app_bar.dart';
import 'package:ecommerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShopsScreen extends StatelessWidget {
  static const namedRoute = '/shops_screen';

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (ctx) => ShopsProvider(),
      child: Scaffold(
        appBar: CustomAppBar(
          child: ShopsAppBar(),
        ),
        body: Body(),
      ),
    );
  }
}

