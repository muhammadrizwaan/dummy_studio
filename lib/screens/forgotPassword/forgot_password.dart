

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password_components.dart';
import 'package:truckoom_shipper/screens/resetPassword/reset_password.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class ForgotPassowrd extends StatefulWidget {
  @override
  _ForgotPassowrdState createState() => _ForgotPassowrdState();
}

class _ForgotPassowrdState extends State<ForgotPassowrd> {
  ForgotPasswordComponent _forgotPasswordComponent;
  TextEditingController email;

  @override
  void initState() {
    _forgotPasswordComponent = ForgotPasswordComponent();
    email = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
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
                    iconName: 'cross_icon.png',
                    text: "Reset ",
                    clickableText: "Password",
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
                          SizedBox(height: AppSizes.height * 0.06,),
                          CommonWidgets.getHeading1Text(text: 'Forgot Password'),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _forgotPasswordComponent.getOTPLableText(text: "Please Enter your Email Credentials"),
                          SizedBox(height: AppSizes.height * 0.05,),
                          CommonWidgets.getLableText(text: "Email"),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'icon_phone_pn.png',
                              textEditingController: email,
                              hintText: "Enter Email"
                          ),
                          SizedBox(height: AppSizes.height * 0.06,),
                          CommonWidgets.getBottomButton(
                              text: "Submit",
                              onPress: () {
                                Navigator.push(context, SlideRightRoute(page: ResetPassword()));
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
