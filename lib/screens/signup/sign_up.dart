import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/bank/bank_screen.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/maps/maps_screen.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';
import 'package:truckoom_shipper/screens/signup/sign_up_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/loader.dart';

class SignUP extends StatefulWidget {
  String tag;

  SignUP({@required this.tag});

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  SignUpComponents _signUpComponents;
  Loader _loader;
  TextEditingController name, email, password, confirm_password;
  bool onCheck = false;

  void initState() {
    _loader = Loader();
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
          padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBar(
                  iconName: 'back_arrow_otp.png',
                  text: "Already have an account? ",
                  clickableText: "Login",
                  onTap: () {
                    Navigator.push(context, SlideRightRoute(page: Login()));
                  },
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
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(text: "Full Name"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'name_icon.png',
                              textEditingController: name,
                              hintText: "Enter Name"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(text: "Email"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'email_icon.png',
                              textEditingController: email,
                              hintText: "Enter Email"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(text: "Password"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'password_icon.png',
                              textEditingController: password,
                              hintText: "Enter Password"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(text: "Confirm Password"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'password_icon.png',
                              textEditingController: confirm_password,
                              hintText: "Confirm Password"),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  checkColor: AppColors.white,
                                  activeColor: AppColors.yellow,
                                  value: onCheck,
                                  onChanged: (bool value) {
                                    setState(() {
                                      onCheck = value;
                                    });
                                  },
                                ),
                                Container(
                                  width: AppSizes.width * 0.75,
                                  child: RichText(
                                    text: TextSpan(
                                        text:
                                        'By creating an account you agree to our ',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Term and Conditions',
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 12,
                                                  fontFamily:
                                                  Assets.poppinsRegular),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.push(context, SlideRightRoute(page: Maps(tag: widget.tag,)));
                                                })
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getBottomButton(
                              text: "SIGNUP",
                              onPress: () {
                                _alertDialogueContainer();
                              })
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
                            "Signup successful !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.colorBlack,
                                fontFamily: Assets.poppinsMedium,
                                fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "Done",
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //       decoration: TextDecoration.none,
                          //       fontSize: 15,
                          //       color: AppColors.colorBlack,
                          //       fontFamily: Assets.poppinsMedium,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, SlideRightRoute(page: Maps(tag: widget.tag,)));
                            },
                            child: Text(
                              "Tap & Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 12,
                                  color: AppColors.yellow,
                                  fontFamily: Assets.poppinsRegular,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425,),
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

  hideLoader(BuildContext context) {
    // Navigator.of(context).pop();
    Navigator.push(context, SlideRightRoute(page: Maps()));
  }


}
