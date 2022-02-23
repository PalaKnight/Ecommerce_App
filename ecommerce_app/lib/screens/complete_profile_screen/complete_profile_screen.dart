import 'package:ecommerce_app/screens/complete_profile_screen/widgets/body.dart';
import 'package:flutter/material.dart';


class CompleteProfileScreen extends StatelessWidget {
  static const namedRoute = '/complete_profile_screen';
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
