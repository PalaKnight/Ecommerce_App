import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/screens/otp_screen/otp_screen.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/widgets/error_text.dart';
import 'package:ecommerce_app/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const namedRoute = '/signup_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isError = false;
  String phoneNumber = '';
  onPhoneNumberChanged(String newPhone) {
    phoneNumber = newPhone;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(children: [
          Expanded(flex: 4, child: SvgPicture.asset('assets/images/logo.svg')),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(width: double.infinity),
                    Text('Your phone number'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: getProportionateScreenWidth(80),
                          height: getProportionateScreenHeight(44),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            color: Colors.white,
                          ),
                          child: Text(
                            '+962',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: getProportionateScreenWidth(226),
                          height: getProportionateScreenHeight(44),
                          child: TextField(
                              onChanged: onPhoneNumberChanged,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (isError)
                      ErrorText(message: 'Please enter a valid phone number'),
                    SizedBox(height: 50),
                    WideButton(
                        onPress: () async {
                          if (phoneNumber.isNotEmpty && phoneNumber.length == 9) {
                            var authProv = context.read<AuthProvider>();
                            await authProv.createUser(phoneNumber);

                            if(authProv.creationResponse.data!.success) {
                              Navigator.of(context)
                                  .pushReplacementNamed(OTPScreen.namedRoute);
                            }
                            else{
                              setState(() {
                                isError = true;
                              });
                            }
                          }
                          else{
                            setState(() {
                              isError = true;
                            });
                          }
                        },
                        text: 'Next'),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
