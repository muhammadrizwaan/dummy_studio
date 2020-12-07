


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BusinessEditProfile extends StatefulWidget {
  @override
  _BusinessEditProfileState createState() => _BusinessEditProfileState();
}

class _BusinessEditProfileState extends State<BusinessEditProfile> {
  BusinessEditProfileComponents _businessEditProfileComponents;
  TextEditingController name, email, business_name, phone_number, trn;
  int _value = 1;

  @override
  void initState() {
    super.initState();
    _businessEditProfileComponents = BusinessEditProfileComponents();
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
                  iconName: Icons.close,
                  onPress: (){
                    Navigator.pop(context);
                  }
              ),
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
                          _businessEditProfileComponents.getProfileImage(
                              profileImg: Assets.profileImg,
                              onPress: (){}
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Full Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: name,
                              hintText: 'Matthew'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Email'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Icons.mail,
                              textEditingController: email,
                              hintText: 'MatthewLawson@mail.com'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Business Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: business_name,
                              hintText: 'Augue vestibulum'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Contact Number'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.mobile,
                              textEditingController: phone_number,
                              hintText: '(430)214-7475'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'TRN'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.mobile,
                              textEditingController: trn,
                              hintText: '430(845785)'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Country'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: AppSizes.height * 0.07,
                            width: AppSizes.width,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child:Icon(Linecons.location, size: 20,)
                                ) ,
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("Netherlands",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text("New Zealand",
                                              style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontFamily: Assets.poppinsLight,
                                                  fontSize: 12,
                                                  color: AppColors.colorBlack
                                              ),
                                            ),
                                            value: 2,
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Nepal",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: Assets.poppinsLight,
                                                    fontSize: 12,
                                                    color: AppColors.colorBlack
                                                ),
                                              ),
                                              value: 3
                                          ),
                                          DropdownMenuItem(
                                              child: Text("Malaysia",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: Assets.poppinsLight,
                                                    fontSize: 12,
                                                    color: AppColors.colorBlack
                                                ),
                                              ),
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
                          SizedBox(height: AppSizes.height * 0.03,),
                          _businessEditProfileComponents.getImagePicker(
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
                              }
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getBottomButton(
                              text: "Update",
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
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
