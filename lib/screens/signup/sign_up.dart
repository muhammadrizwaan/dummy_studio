

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/otpAuthentication/otp_authentication.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number.dart';
import 'package:truckoom_shipper/screens/signup/sign_up_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  SignUpComponents _signUpComponents;
  TextEditingController name, email, password, confirm_password;
  bool onCheck = false;

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
                  iconName: 'back_arrow_otp.png',
                  text: "Already have an account? ",
                  clickableText: "Login",
                  onTap: (){Navigator.push(context, SlideRightRoute(page: Login()));},
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
                          CommonWidgets.getHeading1Text(text: 'Signup'),
                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Full Name"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'name_icon.png',
                              textEditingController: name,
                              hintText: "Enter Name"
                          ),

                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Email"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'email_icon.png',
                              textEditingController: email,
                              hintText: "Enter Email"
                          ),

                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Password"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'password_icon.png',
                              textEditingController: password,
                              hintText: "Enter Password"
                          ),

                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Confirm Password"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'password_icon.png',
                              textEditingController: confirm_password,
                              hintText: "Confirm Password"
                          ),
                          SizedBox(height: 30,),

                          Table(
                            columnWidths: {0: FlexColumnWidth(0.15)},
                            children: [
                              TableRow(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Checkbox(
                                        checkColor: AppColors.white,
                                        activeColor: AppColors.yellow,
                                        value: onCheck,
                                        onChanged: (bool value) {
                                          setState(() {
                                            onCheck = value;
                                          });
                                        },
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: 'By creating an account you agree to our ',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 12),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Term and Conditions',
                                                style: TextStyle(
                                                    color: Colors.amber,
                                                    fontSize: 12,
                                                    fontFamily: Assets.poppinsRegular

                                                ),
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () {
                                                    // navigate to desired screen
                                                  }
                                            )
                                          ]
                                      ),
                                    )
                                  ]
                              )
                            ],

                          ),
                          SizedBox(height: 10,),
                          CommonWidgets.getBottomButton(
                              text: "Signup",
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
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
