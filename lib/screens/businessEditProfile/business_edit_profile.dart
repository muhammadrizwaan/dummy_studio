


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                          _businessEditProfileComponents.getProfileImage(
                              profileImg: Assets.profileImg,
                              onPress: (){}
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: 'Full Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'name_icon.png',
                              textEditingController: name,
                              hintText: 'Matthew'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: 'Email'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'email_icon.png',
                              textEditingController: email,
                              hintText: 'MatthewLawson@mail.com'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: 'Business Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'name_icon.png',
                              textEditingController: business_name,
                              hintText: 'Augue vestibulum'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: 'Contact Number'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'icon_phone_pn.png',
                              textEditingController: phone_number,
                              hintText: '(430)214-7475'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: 'TRN'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'icon_phone_pn.png',
                              textEditingController: trn,
                              hintText: '430(845785)'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getLableText(
                              text: 'Country'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
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
                          SizedBox(height: AppSizes.height * 0.03,),
                          _businessEditProfileComponents.getImagePicker(
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
                              }
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
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
