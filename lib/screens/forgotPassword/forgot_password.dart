import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password_components.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password_provider.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/resetPassword/reset_password.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class ForgotPassowrd extends StatefulWidget {
  @override
  _ForgotPassowrdState createState() => _ForgotPassowrdState();
}

class _ForgotPassowrdState extends State<ForgotPassowrd> {
  ForgotPasswordComponent _forgotPasswordComponent;
  TextEditingController email;
  ForgotPasswordProvider _forgotPasswordProvider;

  @override
  void initState() {
    _forgotPasswordComponent = ForgotPasswordComponent();
    email = TextEditingController();
    _forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ForgotPasswordProvider>(context, listen: true);
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
                  iconName: 'cross_icon.png',
                  text: " ",
                  clickableText: "",
                  // text: "Reset ",
                  // clickableText: "Password",
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
                          CommonWidgets.getHeadingText(text: 'Forgot Password'),
                          SizedBox(height: AppSizes.height * 0.02,),
                          _forgotPasswordComponent.getOTPLableText(text: "Please enter your email credentials"),
                          SizedBox(height: AppSizes.height * 0.05,),
                          CommonWidgets.getSubHeadingText(text: "Email"),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Icons.mail,
                              textEditingController: email,
                              hintText: "Enter Email"
                          ),
                          SizedBox(height: AppSizes.height * 0.08),
                          CommonWidgets.getBottomButton(
                              text: "Submit",
                              onPress: () {
                                _forgotPasswordProvider.getForgotPassword(
                                    context: context, email: email.text);
                                // Navigator.push(context, SlideRightRoute(page: Login()));
                              }),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          )
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
