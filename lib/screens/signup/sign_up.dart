import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number_provider.dart';
import 'package:truckoom_shipper/screens/signup/sign_up_components.dart';
import 'package:truckoom_shipper/screens/signup/sign_up_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';


class SignUP extends StatefulWidget {
  String cell;

  SignUP({ @required this.cell});

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  SignUpComponents _signUpComponents;
  SignUpProvider _signUpProvider;
  PhoneNumberProvider _phoneNumberProvider;
  TextEditingController _name, _email, _password, _confirm_password;
  bool onCheck = false;
  String _cityId;

  void initState() {
    _signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    _signUpProvider.init(context);
    _phoneNumberProvider = Provider.of<PhoneNumberProvider>(context, listen: false);
    _phoneNumberProvider.init(context);
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirm_password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SignUpProvider>(context, listen: true);
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
          child:
          _signUpProvider.isDataFetched?
          Column(
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
                          CommonWidgets.getTextFieldWithImage(
                              isPassword: false,
                              image: Assets.userNameIcon,
                              textEditingController: _name,
                              hintText: "Enter Name"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "Email"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextFieldWithImage(
                            isPassword: false,
                            image: Assets.mailIcon,
                            textEditingController: _email,
                            hintText: "Enter Email",
                          ),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "Password"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextFieldWithImage(
                              isPassword: true,
                              image: Assets.passwordIcon,
                              textEditingController: _password,
                              hintText: "Enter Password"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(
                              text: "Confirm Password"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextFieldWithImage(
                              isPassword: true,
                              image: Assets.passwordIcon,
                              textEditingController: _confirm_password,
                              hintText: "Confirm Password"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(
                              text: "Emirates"),
                          SizedBox(height: AppSizes.height * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.07,
                            width: AppSizes.width * 0.85,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 2, ),
                                  child: Container(
                                    height: AppSizes.height * 0.06,
                                    width: AppSizes.width * 0.06,
                                    child: Image.asset(
                                      Assets.countryIcon,
                                    ),
                                  ),
                                ),
                                SizedBox(width: AppSizes.width*0.03),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<dynamic>(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      value: _cityId,
                                      hint: TextView.getLightText04(
                                        "Choose Emirates",
                                        color: AppColors.colorBlack,
                                      ),
                                      items: _signUpProvider.cityList
                                          .map((item) =>
                                          DropdownMenuItem(
                                            value: item.cityId.toString(),
                                            child: TextView.getLightText04(
                                              item.description,
                                              color: AppColors.colorBlack,
                                            ),
                                          )
                                      ).toList(),
                                      onChanged: (value) {
                                        setState (() {
                                          _cityId = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.03),
                          _getTermsAndCondition(),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getBottomButton(
                            text: "Signup",
                            onPress: () {
                              // _signUpProvider.getIndividualSignUp(
                              //     context, name: _name.text, email, password,
                              //     confirmPassword);
                              _signUpProvider.getIndividualSignUp(
                                  context: context,
                                  cell: widget.cell,
                                  name: _name.text,
                                  email: _email.text,
                                  password: _password.text,
                                  confirmPassword: _confirm_password.text,
                                  onCheck: onCheck,
                                cityId: _cityId
                              );
                              // _alertDialogueContainer();
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
          ):
          Center(
            child: Container(
              height: AppSizes.height * 0.15,
              child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
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
                              CommonWidgets.launchURL();
                              // _phoneNumberProvider.getTermsAndConditions(context: context);
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
