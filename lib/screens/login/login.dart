


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/login/login_components.dart';
import 'package:truckoom_shipper/screens/login/login_provider.dart';
import 'package:truckoom_shipper/screens/maps/maps_screen.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import '../../res/sizes.dart';
import '../../res/sizes.dart';
import '../../res/sizes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginComponents _loginComponents;
  LoginProvider _loginProvider;
  TextEditingController email, password;

  @override
  void initState() {
    _loginComponents = LoginComponents();
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    _loginProvider.init(context);
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          padding: EdgeInsets.only(left: AppSizes.width * 0.08, right: AppSizes.width*0.08, top: AppSizes.width*0.08),
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
                              CommonWidgets.getHeadingText(text: 'Login Now'),
                              SizedBox(height: AppSizes.height * 0.04,),
                              CommonWidgets.getSubHeadingText(text: "Email/Phone Number"),
                              SizedBox(height: AppSizes.height * 0.01,),
                              CommonWidgets.getTextField(
                                  isPassword: false,
                                  leftIcon: Entypo.user,
                                  textEditingController: email,
                                  hintText: "Email/Phone Number"
                              ),
                              SizedBox(height: AppSizes.height * 0.03,),
                              CommonWidgets.getSubHeadingText(text: "Password"),
                              SizedBox(height: AppSizes.height * 0.01,),
                              CommonWidgets.getTextField(
                                  isPassword: true,
                                  leftIcon: Entypo.lock,
                                  textEditingController: password,
                                  hintText: "Enter Password"
                              ),
                              SizedBox(height: AppSizes.height * 0.08,),
                              CommonWidgets.getBottomButton(
                                  text: "Login",
                                  onPress: () {
                                    Navigator.pushReplacement(context, SlideRightRoute(page: Maps(tag: Strings.indiviual)));
                                    // _loginProvider.getLogin(context: context, email: email.text, password: password.text );
                                  }
                              ),
                              Container(
                                margin: EdgeInsets.only(top: AppSizes.height*0.25,),
                                alignment: Alignment.center,
                                child: _loginComponents.getBottomRichText(
                                    text: "Don't have an account? ",
                                    clickableText: 'SIGN UP',
                                    onTap: () {
                                      Navigator.push(context, SlideRightRoute(page: CheckUser()));
                                    }
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
