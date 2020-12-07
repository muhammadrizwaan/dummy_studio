import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/signup/sign_up_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../bottomTab/bottom_tab.dart';

class SignUP extends StatefulWidget {
  String tag;

  SignUP({@required this.tag});

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  SignUpComponents _signUpComponents;
  CustomPopup _loader;
  TextEditingController name, email, password, confirm_password;
  bool onCheck = false;

  void initState() {
    _loader = CustomPopup();
    super.initState();
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
          padding: EdgeInsets.only(
            left: AppSizes.width * 0.08,
            right: AppSizes.width * 0.08,
            top: AppSizes.width * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBarCross(
                  text: "Already have an account? ",
                  iconName: 'cross_icon.png',
                  clickableText: "Login",
                  onPress: () {
                    Navigator.pop(context);
                  },
                  onTap: () {
                    Navigator.push(context, SlideRightRoute(page: Login()));
                  },),
              /*CommonWidgets.getAppBar(
                  iconName: 'back_arrow_otp.png',
                  text: "Already have an account? ",
                  clickableText: "Login",
                  onTap: () {
                    Navigator.push(context, SlideRightRoute(page: Login()));
                  },
                  onPress: () {
                    Navigator.pop(context);
                  }),*/
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonWidgets.getHeadingText(text: 'Signup'),
                          SizedBox(height: AppSizes.height * 0.04),
                          CommonWidgets.getSubHeadingText(text: "Full Name"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: name,
                              hintText: "Enter Name"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "Email"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                            isPassword: false,
                            leftIcon: Icons.email,
                            textEditingController: email,
                            hintText: "Enter Email",
                          ),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "Password"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
                              textEditingController: password,
                              hintText: "Enter Password"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(
                              text: "Confirm Password"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
                              textEditingController: confirm_password,
                              hintText: "Confirm Password"),
                          SizedBox(height: AppSizes.height * 0.03),
                          _getTermsAndCondition(),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getBottomButton(
                            text: "Signup",
                            onPress: () {
                              _alertDialogueContainer();
                            },
                          ),
                          SizedBox(height: AppSizes.height * 0.02),
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

  _alertDialogueContainer() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.12,
                        right: AppSizes.width * 0.12,
                        top: AppSizes.width * 0.07,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.08,
                      ),
                      height: AppSizes.height * 0.2,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Signup Successful",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: AppColors.colorBlack,
                                fontFamily: Assets.poppinsMedium,
                                //fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {

                              Navigator.of(context).pushAndRemoveUntil(
                                  SlideRightRoute(
                                      page: BottomTab(tag: widget.tag)),
                                  (Route<dynamic> route) => false);
                            },
                            child: TextView.getContinueText04(
                              "Tap to Continue",
                              color: AppColors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.425,
                      ),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  _getTermsAndCondition() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              height: AppSizes.height * 0.04,
              width: AppSizes.width * 0.07,
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
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          children: [
            Container(
              height: AppSizes.height * 0.07,
              width: AppSizes.width * 0.69,
              padding: EdgeInsets.only(top: 2),
              child: RichText(
                text: TextSpan(
                    text: 'By creating an account you agree to our ',
                    style: TextStyle(
                      wordSpacing: 0.5,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 12,
                            fontFamily: Assets.poppinsMedium,
                            // fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            })
                    ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
