import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';



class Dot extends StatelessWidget {
  const Dot({Key? key, required this.isSelected}) : super(key: key);
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: 10,
      height: 10,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? kSecondaryColor : Colors.grey,
      ),

    );
  }
}
