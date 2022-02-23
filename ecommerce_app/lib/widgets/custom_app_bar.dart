import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize{
  final Widget child;
  final double height;

  CustomAppBar({required this.child, this.height = kToolbarHeight})
  :super(
    child: child,
    preferredSize: Size.fromHeight(height),
  );

  @override
  Size get  preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          height: preferredSize.height,
          alignment: Alignment.center,
          child: child,
        )
    );
  }
}