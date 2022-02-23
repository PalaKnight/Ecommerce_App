import 'package:ecommerce_app/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:ecommerce_app/screens/items_screen/items_screen.dart';
import 'package:ecommerce_app/screens/otp_screen/otp_screen.dart';
import 'package:ecommerce_app/screens/shops_screen/shops_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SignUpScreen.namedRoute : (ctx) => SignUpScreen(),
  OTPScreen.namedRoute: (ctx) =>OTPScreen(),
  ShopsScreen.namedRoute: (ctx) =>ShopsScreen(),
  ItemsScreen.namedRoute: (ctx) =>ItemsScreen(),
  CompleteProfileScreen.namedRoute: (ctx) =>CompleteProfileScreen(),

};
