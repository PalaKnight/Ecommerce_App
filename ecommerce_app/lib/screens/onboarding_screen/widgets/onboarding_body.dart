import 'package:ecommerce_app/models/onboarding_content.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/constants.dart';


class OnboardingBody extends StatelessWidget {
  OnboardingBody({
    Key? key,
    required this.content,
  }) : super(key: key);
  final OnboardingContent content;




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            children: [
            SizedBox(height: 40,),
            SvgPicture.asset(content.imageURL),

        SizedBox(
          height: 20,
        ),

        Text(
            content.text,
            style: TextStyle(
                fontSize: 20,
                fontWeight:FontWeight.bold
            ),
        ),

        SizedBox(height: 40,),

        Text(
            content.subText,
          style: TextStyle(
              fontSize: 16,
          ),
        ),
    ],
        ),
    ),



      ],
    );
  }

  }

