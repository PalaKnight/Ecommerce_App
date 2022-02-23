import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderPicker extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<AuthProvider>(builder: (_,prov,__){
          return Checkbox(
              value: prov.isMale,
              checkColor: Colors.white,
              activeColor: kPrimaryColor,
              onChanged:(v) {
                prov.setMale(v!);
              }
              );
        }
        ),
        Text(
            'Male',
        style: TextStyle(
          fontSize: getProportionateScreenWidth(14),
        ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(50),
        ),
        Consumer<AuthProvider>(builder: (_,prov,__){
          return Checkbox(
              value: prov.isFemale,
              checkColor: Colors.white,
              activeColor: kPrimaryColor,
              onChanged:(v) {
                prov.setFemale(v!);
              }
          );
        }
        ),
        Text(
          'Female',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
          ),
        ),

      ],
    );
  }
}
