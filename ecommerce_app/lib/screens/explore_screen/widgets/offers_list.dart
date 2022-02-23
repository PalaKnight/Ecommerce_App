import 'package:ecommerce_app/screens/explore_screen/widgets/offer_tile.dart';
import 'package:flutter/material.dart';

class OffersList extends StatelessWidget {
  const OffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160 ,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
          itemBuilder: (ctx,index){
        return OfferTile();
      }
      ),
    );
  }
}
