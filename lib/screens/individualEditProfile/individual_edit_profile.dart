import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile_components.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class IndividualEditProfile extends StatefulWidget {
  @override
  _IndividualEditProfileState createState() => _IndividualEditProfileState();
}

class _IndividualEditProfileState extends State<IndividualEditProfile> {
  IndividualEditProfileComponents _individualEditProfileComponents;
  IndividualEditProfileProvider _individualEditProfileProvider;
  TextEditingController _name, _email, _password, _confirm_password;
  String _cityId = Constants.getCityId().toString();
  @override
  void initState() {
    super.initState();
    _individualEditProfileComponents = IndividualEditProfileComponents();
    _name = TextEditingController(text: Constants.getUserName());
    _email = TextEditingController(text: Constants.getUserEmail());
    _password = TextEditingController(text: Constants.getPassword());
    _confirm_password = TextEditingController(text: Constants.getPassword());
    _individualEditProfileProvider = Provider.of<IndividualEditProfileProvider>(context, listen: false);
    _individualEditProfileProvider.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<IndividualEditProfileProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: _individualEditProfileProvider.isDataFetched?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _individualEditProfileComponents.getTabBarCross(
                  text: 'Edit Profile',
                  image: Assets.crossIcon,
                  onPress: () {
                    Navigator.pop(context);
                  }),
              Divider(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08,
                          top: AppSizes.width * 0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Center(
                              child: _individualEditProfileComponents.getProfileImage(
                                  profileImg: Constants.getUserImage(),
                                  onPress: () {
                                    _individualEditProfileProvider.onEditImage(context: context);
                                  })),
                          SizedBox(
                            height: AppSizes.height * 0.05,
                          ),
                          CommonWidgets.getSubHeadingText(text: "Full Name"),
                          SizedBox(
                            height: 10,
                          ),
                          // CommonWidgets.getTextField(
                          //     isPassword: false,
                          //     leftIcon: Entypo.user,
                          //     textEditingController: _name,
                          //     hintText: "Enter Name",
                          // ),
                          CommonWidgets.getTextFieldWithImage(
                              isPassword: false,
                              leftIcon: Assets.nameImage,
                              textEditingController: _name,
                              hintText: "Enter Name",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getSubHeadingText(text: "Email"),
                          SizedBox(
                            height: 10,
                          ),
                          _individualEditProfileComponents.getTextField(
                              isPassword: false,
                              leftIcon: Assets.emailImage,
                              textEditingController: _email,
                              hintText: "Enter Email",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getSubHeadingText(text: "Password"),
                          SizedBox(
                            height: 10,
                          ),
                          // CommonWidgets.getTextField(
                          //     isPassword: true,
                          //     leftIcon: Entypo.lock,
                          //     textEditingController: _password,
                          //     hintText: "Enter Password"),
                          CommonWidgets.getTextFieldWithImage(
                              isPassword: true,
                              leftIcon: Assets.passwordImage,
                              textEditingController: _password,
                              hintText: "Enter Password"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getSubHeadingText(
                              text: "Confirm Password"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextFieldWithImage(
                              isPassword: true,
                              leftIcon: Assets.passwordImage,
                              textEditingController: _confirm_password,
                              hintText: "Confirm Password",
                          ),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(
                              text: "City"),
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
                                Container(
                                    height: AppSizes.height * 0.06,
                                    width: AppSizes.width * 0.06,
                                    child: Image.asset(Assets.vehicle)),
                                SizedBox(width: AppSizes.width*0.03),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<dynamic>(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      value: _cityId,
                                      hint: TextView.getLightText04(
                                        "Select city",
                                        color: AppColors.colorBlack,
                                      ),
                                      items: _individualEditProfileProvider.cityList
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
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getBottomButton(
                              text: "Update",
                              onPress: () {
                                _individualEditProfileProvider.individualUpdateProfile(context: context,
                                    name: _name.text,
                                    password: _password.text,
                                    confirmPassword: _confirm_password.text,
                                  cityId: _cityId
                                );
                              }),
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
}
