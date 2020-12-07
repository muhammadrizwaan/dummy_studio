


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import 'otp_authentication_components.dart';

class OTPAuthentication extends StatefulWidget {
  String tag;

  OTPAuthentication({@required this.tag});
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
          padding: EdgeInsets.only(
            left: AppSizes.width * 0.08,
            right: AppSizes.width * 0.08,
            top: AppSizes.width * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBar(
                  iconName: 'back_arrow_otp.png',
                  text: "",
                  clickableText: "",
                  onTap: (){},
                  onPress: () {
                    Navigator.pop(context);
                  }),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height*0.03,),
                          CommonWidgets.getHeadingText(text: 'OTP Authentication'),
                          SizedBox(height: AppSizes.height*0.02,),
                          _otpAuthenticationComponents.getOTPLableText(text: "Enter the 4-digit code sent to you at"),
                          SizedBox(height: AppSizes.height*0.035,),
                          CommonWidgets.getSubHeadingText(text: "Enter Verification Code"),
                          SizedBox(height: AppSizes.height*0.008,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.mobile,
                              textEditingController: otp_code,
                              hintText: "Verification Code"
                          ),
                          SizedBox(height: AppSizes.height*0.035,),
                          _otpAuthenticationComponents.getRichText(
                              text: "I didn’t receive code. ",
                              clickableText: 'Resend Code',
                              onTap: () {}
                          ),
                          SizedBox(height: AppSizes.height*0.02,),
                          CommonWidgets.getBottomButton(
                              text: "Submit",
                              onPress: () {
                                if(widget.tag == Strings.indiviual){
                                  Navigator.push(context, SlideRightRoute(page: SignUP(tag: widget.tag,)));
                                }
                                else if(widget.tag == Strings.business){
                                  Navigator.push(context, SlideRightRoute(page: BusinessSignup(tag: widget.tag,)));
                                }
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