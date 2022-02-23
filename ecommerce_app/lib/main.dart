import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/providers/general_provider.dart';
import 'package:ecommerce_app/providers/location_provider.dart';
import 'package:ecommerce_app/providers/sections_provider.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:ecommerce_app/screens/explore_screen/explore_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => SectionsProvider()),
        ChangeNotifierProvider(create: (ctx) => LocationProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        Provider(create: (ctx) => GeneralProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: kScaffoldColor,
            elevation: 0,
            iconTheme: IconThemeData(color: kSecondaryColor),
          ),
          scaffoldBackgroundColor: kScaffoldColor,
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        home: ExploreScreen(),
      ),
    );
  }
}

