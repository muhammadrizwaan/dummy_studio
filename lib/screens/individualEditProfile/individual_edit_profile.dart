

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class IndividualEditProfile extends StatefulWidget {
  @override
  _IndividualEditProfileState createState() => _IndividualEditProfileState();
}

class _IndividualEditProfileState extends State<IndividualEditProfile> {
  IndividualEditProfileComponents _individualEditProfileComponents;
  TextEditingController name, email, password, confirm_password;

  @override
  void initState() {
    super.initState();
    _individualEditProfileComponents = IndividualEditProfileComponents();
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
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.tabsAppBar1(
                  text: 'Edit Profile',
                  iconName: Assets.crossIcon,
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),
              Divider(height: 10,),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSizes.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.01,),
                          Center(
                            child: _individualEditProfileComponents.getProfileImage(
                                profileImg: Assets.profileImg,
                                onPress: (){}
                            )
                          ),
                          SizedBox(height: AppSizes.height * 0.05,),
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
                          CommonWidgets.getBottomButton(
                              text: "Submit",
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
