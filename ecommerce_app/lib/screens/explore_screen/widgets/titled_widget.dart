import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitledWidget extends StatelessWidget {
  const TitledWidget(
      {
        Key? key,
        required this.title,
        required this.widget,
        required this.isOnWhiteBackground,
      }
      ) : super(key: key);
  final String title;
  final Widget widget;
  final bool isOnWhiteBackground;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: isOnWhiteBackground ? kDarkTextColor : Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        widget,
      ],
    );
  }
}
