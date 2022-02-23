import 'package:ecommerce_app/models/shops.dart';
import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/screens/items_screen/items_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({Key? key, required this.shop}) : super(key: key);
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        context.read<GeneralProvider>().selectedShop = shop;
        Navigator.of(context).pushNamed(ItemsScreen.namedRoute);
      },
      child: SizedBox(
        height: getProportionateScreenHeight(96),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(96),
                width: getProportionateScreenWidth(96),
                child: ClipRRect(borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                //child: Image.asset('assets/icons/${shop.logoURL}'),
                  child: Image.network('http://furniture.sketchandscript.com/${shop.logoURL}')
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:
                      [
                        Text(
                          shop.name,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/location.svg'),
                            Text(
                                shop.details,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(12)
                            ),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Container
                              (
                              width: 30,
                                height: 30,
                                child: SvgPicture.asset('assets/icons/goldenstar.svg')),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '4.5',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(12),
                            ),
                            ),
                            Spacer(),
                            Text(
                                '${shop.distance.toStringAsFixed(1)} KM',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(12),
                                    )
                            ),
                            SizedBox(
                              width:  5,
                            )

                          ],
                        )
                      ],
              ),
                  ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
