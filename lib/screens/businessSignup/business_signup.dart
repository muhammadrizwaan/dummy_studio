

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup_components.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BusinessSignup extends StatefulWidget {
  @override
  _BusinessSignupState createState() => _BusinessSignupState();
}

class _BusinessSignupState extends State<BusinessSignup> {
  BusinessSignupComponents _businessSignupComponents;
  TextEditingController name, email, password, confirm_Password;
  bool onCheck = false;
  int _value = 1;

  @override
  void initState() {
    _businessSignupComponents = BusinessSignupComponents();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirm_Password = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.all(AppSizes.width * 0.05),
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBar(
                  iconName: 'cross_icon.png',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonWidgets.getHeading1Text(text: 'Signup'),
                              _businessSignupComponents.getBusinessSignupStep()
                            ],
                          ),
                          // CommonWidgets.getHeading1Text(text: 'Signup'),
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
                              textEditingController: confirm_Password,
                              hintText: "Confirm Password"
                          ),
                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Country"),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.06,
                            width: AppSizes.width,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image(image: AssetImage('assets/png/location_icon.png')),
                                ) ,
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(

                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Netherlands"),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("New Zealand"),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Nepal"),
                                              value: 3
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Malaysia"),
                                              value: 4
                                          )
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                          });
                                        }
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                          SizedBox(height: 30,),

                          Table(
                            columnWidths: {0: FlexColumnWidth(0.15)},
                            children: [
                              TableRow(
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
                          // _businessSignupComponents.checkTermAndCondition(
                          //   onCheck: onCheck,
                          //   onChanged: (onCheck){
                          //     setState(() {
                          //       onCheck = true;
                          //     });
                          //   },
                          //   onTap: (){}
                          // ),
                          CommonWidgets.getBottomButton(
                              text: "Next",
                              onPress: () {
                                Navigator.push(context, SlideRightRoute(page: BusinessInformation()));
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
