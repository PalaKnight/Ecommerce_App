import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/screens/complete_profile_screen//complete_profile_screen.dart';
import 'package:ecommerce_app/screens/otp_screen/widgets/otp_textfields.dart';
import 'package:ecommerce_app/screens/otp_screen/widgets/otp_timer.dart';
import 'package:ecommerce_app/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  static const namedRoute = '/otp_screen';
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool showTimer = true;
  toggleTimer(){
    setState(() {
      showTimer = !showTimer;
    });
  }
  String otp = '';
  void onCompleted(String newOtp){
    otp = newOtp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verification'),),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verify Your Number',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: OTPTextField(onCompleted: onCompleted,),
              ),
              showTimer ? OTPTimer(toggleTimer)
                        :TextButton(
                                    onPressed: toggleTimer,
                                    child: Text(
                                        "Didn't receive OTP? press here",
                                        style: TextStyle(color: kPrimaryColor)
                                    )
               ),
              SizedBox(
                height: 20,
              ),




              WideButton(onPress: () async {
                var authProv = context.read<AuthProvider>();
                if(otp.length == 4){
                  await authProv.verifyUser(otp);
                  if(authProv.verificationResponse.data!){
                    Navigator.of(context).pushReplacementNamed(CompleteProfileScreen.namedRoute);
                  }
                  else{}
                }
                else{}

              }, text: 'Verify now')
            ],
          ),
        ),
      ),
    );
  }
}
