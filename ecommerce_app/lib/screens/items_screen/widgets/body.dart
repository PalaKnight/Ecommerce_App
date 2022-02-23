import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/providers/items_provider.dart';
import 'package:ecommerce_app/providers/subCategories_provider.dart';
import 'package:ecommerce_app/screens/items_screen/widgets/header.dart';
import 'package:ecommerce_app/screens/items_screen/widgets/sections_and_items.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        SectionsAndItems(),
      ],
    );
        }
  }

