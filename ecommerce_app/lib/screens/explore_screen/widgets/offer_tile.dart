import 'package:ecommerce_app/models/offer_data.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class OfferTile extends StatelessWidget {
  var offerData =
  OfferData(
      'Costa Coffee',
      '0xFF363636',
      '0xFFFFFFFF',
      'https://www.franchise-uk.co.uk/wp-content/uploads/2016/01/CostaCoffee.png',
      '30% off');

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
      width: getProportionateScreenWidth(320),
      height: getProportionateScreenHeight(150),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
         color: Color(
             int.parse(offerData.backgroundColor)
         ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )
      ),
      child:Row(
        children: [

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                offerData.shopName,
                  style: TextStyle(
                    color: Color(int.parse(offerData.foregroundColor)),
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                    width: getProportionateScreenWidth(100),
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(
                              int.parse(offerData.foregroundColor),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          offerData.offerText,
                          style: TextStyle(
                            color:  Color(int.parse(offerData.backgroundColor),
                            ),
                          ),
                        )
                    ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(offerData.logoUrl),
            ),
          ),
        ],
      )
    );
  }
}
