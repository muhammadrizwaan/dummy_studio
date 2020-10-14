

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/login/login_components.dart';
import 'package:truckoom_shipper/screens/maps/maps_screen.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginComponents _loginComponents;
  TextEditingController email, password;

  @override
  void initState() {
    _loginComponents = LoginComponents();
    email = TextEditingController();
    password = TextEditingController();
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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonWidgets.getAppBar(
                      iconName: 'back_arrow_otp.png',
                      text: "Forgot ",
                      clickableText: "Password",
                      onTap: (){Navigator.push(context, SlideRightRoute(page: ForgotPassowrd()));},
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
                              CommonWidgets.getHeading1Text(text: 'Login Now'),
                              SizedBox(height: AppSizes.height * 0.04,),
                              CommonWidgets.getLableText(text: "Email/Phone Number"),
                              SizedBox(height: AppSizes.height * 0.01,),
                              CommonWidgets.getTextField(
                                  isPassword: false,
                                  leftIcon: 'name_icon.png',
                                  textEditingController: email,
                                  hintText: "Enter Email"
                              ),
                              SizedBox(height: AppSizes.height * 0.03,),
                              CommonWidgets.getLableText(text: "Password"),
                              SizedBox(height: AppSizes.height * 0.01,),
                              CommonWidgets.getTextField(
                                  isPassword: true,
                                  leftIcon: 'password_icon.png',
                                  textEditingController: password,
                                  hintText: "Enter Password"
                              ),
                              SizedBox(height: AppSizes.height * 0.04,),
                              CommonWidgets.getBottomButton(
                                  text: "Login",
                                  onPress: () {
                                    // Navigator.push(context, SlideRightRoute(page: BottomTab()));
                                    Navigator.push(context, SlideRightRoute(page: Maps()));
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
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/4, bottom: MediaQuery.of(context).size.height*0.02,),
                  child: _loginComponents.getBottomRichText(
                      text: "Don't have an account? ",
                      clickableText: 'SIGN UP',
                      onTap: () {
                        Navigator.push(context, SlideRightRoute(page: PhoneNumber()));
                      }
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
