

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/resetPassword/reset_password_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordComponents _resetPasswordComponents;
  TextEditingController password, confirm_Password;

  @override
  void initState() {
    _resetPasswordComponents = ResetPasswordComponents();
    password = TextEditingController();
    confirm_Password = TextEditingController();
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
              CommonWidgets.getAppBar(
                  iconName: 'cross_icon.png',
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
                          SizedBox(height: AppSizes.height * 0.06,),
                          CommonWidgets.getHeadingText(text: 'Reset Password'),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _resetPasswordComponents.getOTPLableText(text: "Please Enter your Password"),
                          SizedBox(height: AppSizes.height * 0.05,),
                          CommonWidgets.getSubHeadingText(text: "Password"),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.mobile,
                              textEditingController: password,
                              hintText: "Enter Password"
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),
                          CommonWidgets.getSubHeadingText(text: "Confirm Password"),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.mobile,
                              textEditingController: confirm_Password,
                              hintText: "Confirm Password"
                          ),
                          SizedBox(height: AppSizes.height * 0.06,),
                          CommonWidgets.getBottomButton(
                              text: "Submit",
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: ResetPassword()));
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
