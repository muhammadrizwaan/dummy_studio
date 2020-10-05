


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import 'otp_authentication_components.dart';

class OTPAuthentication extends StatefulWidget {
  @override
  _OTPAuthenticationState createState() => _OTPAuthenticationState();
}

class _OTPAuthenticationState extends State<OTPAuthentication> {
  OTPAuthenticationComponents _otpAuthenticationComponents;
  TextEditingController otp_code;
  bool onCheck = false;

  @override
  void initState() {
    _otpAuthenticationComponents = OTPAuthenticationComponents();
    otp_code = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.initializeSize(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Positioned(
                top: 0,
                child: CommonWidgets.getAppBar(
                    iconName: 'back_arrow_otp.png',
                    text: "",
                    clickableText: "",
                    onTap: (){},
                    onPress: () {
                      Navigator.pop(context);
                    }),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonWidgets.getHeading1Text(text: 'OTP Authentication'),
                          SizedBox(height: 30,),
                          _otpAuthenticationComponents.getOTPLableText(text: "Enter the 4-digit code sent to you at"),
                          SizedBox(height: 20,),
                          CommonWidgets.getLableText(text: "Enter Varification Code"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'icon_phone_pn.png',
                              textEditingController: otp_code,
                              hintText: "Enter Varification Code"
                          ),
                          SizedBox(height: 30,),
                          _otpAuthenticationComponents.getRichText(
                              text: "I don't receive code. ",
                              clickableText: 'Resend Code',
                              onTap: () {}
                          ),
                          SizedBox(height: 15,),
                          CommonWidgets.getBottomButton(
                              text: "Submit",
                              onPress: () {
                                Navigator.push(context, SlideRightRoute(page: SignUP()));
                              }
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
