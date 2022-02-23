import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class ItemExploration  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(320),
      height: getProportionateScreenHeight(100),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        image:DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://blog.hubspot.com/hubfs/best-free-stock-photo-sites.jpg'
          ),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        )
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(110),

        child: Text(
            'Subscription Plans',
          style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
