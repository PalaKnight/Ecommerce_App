import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../size_config.dart';

class OTPTextField extends StatefulWidget {
  const OTPTextField({Key? key, required this.onCompleted}) : super(key: key);
  final Function onCompleted;

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: getProportionateScreenHeight(64),
        fieldWidth: getProportionateScreenWidth(56),
        activeFillColor: Colors.white,
        activeColor: Color(0xFFADB3BF),
        selectedColor: Color(0xFFADB3BF),
        disabledColor: Color(0xFFADB3BF),
        inactiveColor: Color(0xFFADB3BF),
        inactiveFillColor: Color(0xFFADB3BF),
        selectedFillColor: Color(0xFFADB3BF),
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: (val){widget.onCompleted(val);},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
