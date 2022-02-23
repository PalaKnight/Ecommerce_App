import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
    this.height = 44,
    this.width = 345,
    this.enabled = true,
    required this.hintText,
    this.icon,
    required this.onChanged,
    this.tec,
  }) : super(key: key);

  final double width, height;
  final String hintText;
  final bool enabled;
  final Function onChanged;
  final Icon? icon;
  final TextEditingController? tec;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      child: TextFormField(
        controller: tec,
        onChanged: (value) {
          onChanged(value);
        },
        enabled: enabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: icon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: kSeconderyHintColor),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
