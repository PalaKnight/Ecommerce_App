import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/providers/location_provider.dart';
import 'package:ecommerce_app/providers/shops_provider.dart';
import 'package:ecommerce_app/screens/items_screen/items_screen.dart';
import 'package:ecommerce_app/screens/shops_screen/widgets/shop_tile.dart';
import 'package:ecommerce_app/services/cc_response.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/widgets/search_field.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var selectedSectionId = context.read<GeneralProvider>().selectedSectionId;
    var currentLocation = context.read<LocationProvider>().currentLocation;
    context.read<ShopsProvider>().getShops(
        currentLocation!.latitude, currentLocation.longitude, selectedSectionId
    );
  }
  @override
  Widget build(BuildContext context) {


    var watcher = context.watch<ShopsProvider>();
    return watcher.shopsResponse.status == Status.LOADING
        ? Center(
        child: CircularProgressIndicator())
        : watcher.shopsResponse.status == Status.ERROR
        ? Center(
        child: Text(watcher.shopsResponse.message!),
    )
        : Container(
            margin: EdgeInsets.all(getProportionateScreenWidth(20)
      ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(onWhiteBackground: true),
              SizedBox(
                height: 20,
              ),
              Text(
                'Coffee Houses',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 5,
              ),
              Text.rich(
                TextSpan(
                  text: 'Note: ',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                ),
                  children: [
                    TextSpan(
                        text:'Only in 5 Km range',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        color: kGreyTextColor,
                      )

                    )
                  ]
              ),
    ),
                  SizedBox(height: 40,),

                  Expanded(
                  child: ListView.builder(
                  itemCount: watcher.shopsResponse.data!.length,
                  itemBuilder: (ctx, index) {
                    return ShopTile(shop: watcher.shopsResponse.data![index]);
                  }
                  ),
                  ),
            ]
          ),
    );
  }
}

