import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/screens/complete_profile_screen/widgets/custom_date_picker.dart';
import 'package:ecommerce_app/screens/explore_screen/widgets/titled_widget.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/widgets/default_textfield.dart';
import 'package:ecommerce_app/widgets/small_titled_widget.dart';
import 'package:ecommerce_app/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gender_picker.dart';

class Body extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
                'Complete Profile',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              height: 40,
            ),
            SmallTitledWidget(
                title: 'Your Name',
                widget: DefaultTextField(
                  hintText: 'Your Name',
                  onChanged: (v) {
                    context.read<AuthProvider>().setName(v);
                  },
                ),
                isOnWhiteBackground: true
            ),
            SizedBox(
              height: 20,
            ),
            SmallTitledWidget(
                title: 'Your Email (Optional)',
                widget: DefaultTextField(
                  hintText: 'Your Email',
                  onChanged: (v) {
                    context.read<AuthProvider>().setEmail(v);
                  },
                ),
                isOnWhiteBackground: true
            ),
            SizedBox(
              height: 20,
            ),
            SmallTitledWidget(
                title: "Gender (Optional)",
                widget: GenderPicker(),
                isOnWhiteBackground: true
            ),
            SizedBox(
              height: 20,
            ),
            SmallTitledWidget(
                title: "Select your birth date ",
                widget: CustomDatePicker(),
                isOnWhiteBackground: true
            ),
            Spacer(),
            WideButton(onPress: () {
              context.read<AuthProvider>().completeProfile();
              print(context.read<AuthProvider>().completeProfileResponse);
            } ,
                text: 'GetStarted',)

          ],
        ),
      ),
    );
  }
}
