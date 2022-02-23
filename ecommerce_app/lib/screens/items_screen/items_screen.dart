import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/providers/items_provider.dart';
import 'package:ecommerce_app/providers/subCategories_provider.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:ecommerce_app/services/subCategories_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/body.dart';

class ItemsScreen extends StatelessWidget {
  static const namedRoute = '/items_screen';

  @override
  Widget build(BuildContext context) {
    var generalProvider = context.read<GeneralProvider>();

    return ChangeNotifierProvider(
      create: (ctx) => SubCategoriesProvider(
          generalProvider.selectedShop!.id,
          generalProvider.selectedSectionId,
      ),
      child: Consumer<SubCategoriesProvider>(
        builder: (_, prov,__) {
          return Scaffold(
            body:prov.subCategoriesResponse.status == Status.LOADING
                ? Center(child: CircularProgressIndicator())
                :Body(),
      );
      }
      ),
    );
  }
}
