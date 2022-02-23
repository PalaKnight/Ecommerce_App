import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultBackButton extends StatelessWidget {
  final Color color;
  const DefaultBackButton({Key? key, this.color = Colors.black})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.of(context).pop();
    }, icon: Container(
        child: SvgPicture.asset('assets/icons/back button.svg'),
      color: Colors.white,
    ),

    );
  }
}