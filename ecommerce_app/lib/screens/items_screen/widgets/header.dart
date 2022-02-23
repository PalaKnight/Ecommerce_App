import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/widgets/default_back_button.dart';
import 'package:ecommerce_app/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(300),
      child: Stack(
        clipBehavior: Clip.none,
        overflow: Overflow.visible,
        children: [
          Positioned(
            top: 0,
            bottom: 50,
            right: 0,
            left: 0,
            child: Consumer<GeneralProvider>(
            builder: (_,s, __){
              return Image.network(
                  'http://furniture.sketchandscript.com/${s.selectedShop!.logoURL}',
                fit: BoxFit.cover,
              );
            },
          ),
          ),
          Positioned(
            top: 40,
            left: 10,
            width: 40,
            height: 40,
            child: DefaultBackButton(
            color: Colors.green,
          ),
          ),
            Positioned(
              top: 50,
                right: 50,
                left: 50,

                child: Consumer<GeneralProvider>(
                  builder: (_, s, __){
                    return Text(
                        s.selectedShop!.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    );
                }
                ),
        ),
          Positioned(
            bottom: 25,
            left: 20,
            right: 20,
            height: 48,

            child: SearchTextField(
            onWhiteBackground: false,
          ),
          ),
        ],
      ),
    );
  }
}
