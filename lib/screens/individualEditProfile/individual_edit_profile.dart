

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile_components.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
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
              _individualEditProfileComponents.getTabBarCross(
                  text: 'Edit Profile',
                  image: Assets.crossIcon,
                  onPress: (){
                    Navigator.pop(context);
                  }),
              /*CommonWidgets.tabsAppBar1(
                  text: 'Edit Profile',
                  iconName: Icons.close,
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),*/
              Divider(height: 10,),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: AppSizes.width * 0.08, right: AppSizes.width*0.08, top: AppSizes.width*0.08),
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
                          CommonWidgets.getSubHeadingText(text: "Full Name"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: name,
                              hintText: "Enter Name"
                          ),

                          SizedBox(height: 30,),
                          CommonWidgets.getSubHeadingText(text: "Email"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Icons.mail,
                              textEditingController: email,
                              hintText: "Enter Email"
                          ),

                          SizedBox(height: 30,),
                          CommonWidgets.getSubHeadingText(text: "Password"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
                              textEditingController: password,
                              hintText: "Enter Password"
                          ),

                          SizedBox(height: 30,),
                          CommonWidgets.getSubHeadingText(text: "Confirm Password"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
                              textEditingController: confirm_password,
                              hintText: "Confirm Password"
                          ),
                          SizedBox(height: 30,),
                          CommonWidgets.getBottomButton(
                              text: "Update",
                              onPress: () {
                                Navigator.pushReplacement(context, SlideRightRoute(page: IndividualProfile()));
                              }
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
}
