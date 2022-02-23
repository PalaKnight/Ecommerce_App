import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WideButton extends StatelessWidget {
  const WideButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  final Function onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(315),
      height: getProportionateScreenHeight(44),
      child: ElevatedButton(
        child: Text(text),
        onPressed: () {
          onPress();
        },
        style:
        ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ),
      ),
    );
  }
}
