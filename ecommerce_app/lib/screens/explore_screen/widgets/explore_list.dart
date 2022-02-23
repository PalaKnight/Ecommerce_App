import 'package:ecommerce_app/screens/explore_screen/widgets/item_exploration.dart';
import 'package:flutter/material.dart';

class ExploreList extends StatelessWidget {
  const ExploreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemExploration(),
        ItemExploration(),
        ItemExploration(),
      ],
    );
  }
}
