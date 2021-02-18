import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile_components.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class IndividualEditProfile extends StatefulWidget {
  @override
  _IndividualEditProfileState createState() => _IndividualEditProfileState();
}

class _IndividualEditProfileState extends State<IndividualEditProfile> {
  IndividualEditProfileComponents _individualEditProfileComponents;
  IndividualEditProfileProvider _individualEditProfileProvider;
  TextEditingController _name, _email, _password, _confirm_password;

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
          child: Column(
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
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: _name,
                              hintText: "Enter Name"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getSubHeadingText(text: "Email"),
                          SizedBox(
                            height: 10,
                          ),
                          _individualEditProfileComponents.getTextField(
                              isPassword: false,
                              leftIcon: Icons.mail,
                              textEditingController: _email,
                              hintText: "Enter Email"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getSubHeadingText(text: "Password"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
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
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
                              textEditingController: _confirm_password,
                              hintText: "Confirm Password",
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
                                    confirmPassword: _confirm_password.text);
                              }),
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
