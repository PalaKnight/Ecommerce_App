import 'package:ecommerce_app/screens/onboarding_screen//widgets/dot.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/onboarding_screen/widgets/onboarding_body.dart';
import 'package:ecommerce_app/models/onboarding_content.dart';

import '../../constants.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();


  List<OnboardingContent> onboardingContentList = [
    OnboardingContent(imageURL:'assets/images/ob1.svg',
        text: 'Resturants all over jordan',
        subText: 'Get your food from closest resturant'),

    OnboardingContent(imageURL:'assets/images/ob1.svg',
        text: 'Resturants all over jordan',
        subText: 'Get your food from closest resturant'),

    OnboardingContent(imageURL:'assets/images/ob1.svg',
        text: 'Resturants all over jordan',
        subText: 'Get your food from closest resturant'),

    OnboardingContent(imageURL:'assets/images/ob1.svg',
        text: 'Resturants all over jordan',
        subText: 'Get your food from closest resturant')
  ];


  void goToNextPage(){
    _pageController.nextPage(duration: kThemeAnimationDuration, curve: Curves.linear);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (value){
                setState(() {
                  _currentIndex = value;
                });
              },
            itemCount: onboardingContentList.length,
            itemBuilder: (context, index){
              return Container (
                width: double.infinity,
                child: OnboardingBody(
                  content: onboardingContentList[index],
                ),
              );
            },
          ),
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(onboardingContentList.length, (index)  {
                                return Dot(isSelected: index == _currentIndex);
                              }
                              ),
                    ],
                ),
                  SizedBox(height: 40,),
                  _currentIndex == onboardingContentList.length-1
                      ? SizedBox(
                      width: getProportionateScreenWidth(223),
                      height: getProportionateScreenHeight(44),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(kPrimaryColor)
                          ),

                          onPressed: (){
                            Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.namedRoute);
                          },
                          child: Text('GET STARTED')))
                      :Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SignUpScreen.namedRoute);
                        },
                        child: Text(''
                            'SKIP',
                          style: TextStyle(
                            color: kSecondaryColor,
                          ),
                        ),

                      ),


                      TextButton(
                          onPressed:() {
                           goToNextPage();
                          },
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          )
                      ),

                    ],
                  ),
                ],
              )
          ),
          ]
        ),
    );
  }
}
