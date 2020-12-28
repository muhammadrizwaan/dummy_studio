

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import 'business_edit_profile_components.dart';
import 'business_edit_profile_provider.dart';

class BusinessEditProfile extends StatefulWidget {
  @override
  _BusinessEditProfileState createState() => _BusinessEditProfileState();
}

class _BusinessEditProfileState extends State<BusinessEditProfile> {
  BusinessEditProfileComponents _businessEditProfileComponents;
  BusinessEditProfileProvider _businessEditProfileProvider;
  String _selectedValue;
  DateTime pickedDate;
  TextEditingController _name, _email, _password, _confirmPassword, _businessName, _businessPhone, _trn;

  @override
  void initState() {
    super.initState();
    _businessEditProfileComponents = BusinessEditProfileComponents();
    _name = TextEditingController(text: Constants.getUserName());
    _email = TextEditingController(text: Constants.getUserEmail());
    _password = TextEditingController(text: Constants.getPassword());
    _confirmPassword = TextEditingController(text: Constants.getPassword());
    _businessName = TextEditingController(text: Constants.getCommpanyName());
    _businessPhone = TextEditingController(text: Constants.getCommpanyPhone());
    _trn = TextEditingController(text: Constants.getCommpanyTrn());
    pickedDate = DateTime.now();
    print(pickedDate);
    _businessEditProfileProvider = Provider.of<BusinessEditProfileProvider>(context, listen: false);
    _businessEditProfileProvider.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BusinessEditProfileProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: _businessEditProfileProvider.isDataFetched ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _businessEditProfileComponents.getTabBarCross(
                  text: 'Edit Profile',
                  image: Assets.crossIcon,
                  onPress: () {
                    Navigator.pop(context);
                  }),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08,
                          top: AppSizes.width * 0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.01,),
                          _businessEditProfileComponents.getProfileImage(
                              profileImg: Constants.getUserImage(),
                              onPress: () {
                                _businessEditProfileProvider.onEditImage(
                                    context: context);
                              }
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Full Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: _name,
                              hintText: 'Enter Full Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Email'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _businessEditProfileComponents.getTextField(
                              isPassword: false,
                              leftIcon: Icons.mail,
                              textEditingController: _email,
                              hintText: 'Enter Email'
                          ),

                          SizedBox(height: AppSizes.height * 0.03,),
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
                              textEditingController: _confirmPassword,
                              hintText: "Confirm Password"),

                          CommonWidgets.getSubHeadingText(
                              text: 'Business Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: _businessName,
                              hintText: 'Enter Business Name'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: "License Expiry Date"),
                          SizedBox(height: AppSizes.height * 0.01),
                          _businessEditProfileComponents.getDateField(
                              onDate: () {
                                _showDate();
                              },
                              date:
                              "${pickedDate.day}/${pickedDate
                                  .month}/${pickedDate.year}"),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'Contact Number'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getPhoneNumberField(
                              isPassword: false,
                              leftIcon: Entypo.mobile,
                              textEditingController: _businessPhone,
                              hintText: 'Enter Contact Number'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'TRN'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          CommonWidgets.getPhoneNumberField(
                              isPassword: false,
                              leftIcon: Entypo.mobile,
                              textEditingController: _trn,
                              hintText: 'Enter TRN'
                          ),
                          SizedBox(height: AppSizes.height * 0.03,),
                          CommonWidgets.getSubHeadingText(
                              text: 'City'
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
                                    child: Icon(Linecons.location, size: 20,)
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      isExpanded: true,
                                      value: _selectedValue,
                                      hint: TextView.getLightText04(
                                        Constants.getCityName(),
                                        color: AppColors.colorBlack,
                                      ),
                                      items: _businessEditProfileProvider
                                          .description
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: TextView.getLightText04(
                                                value,
                                                color: AppColors.colorBlack,
                                              ),
                                            );
                                          }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          _selectedValue = value;
                                        });
                                      },
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
                                _businessEditProfileProvider
                                    .businessUpdateProfile(context: context,
                                    name: _name.text,
                                    password: _password.text,
                                    confirmPassword: _confirmPassword.text,
                                    businessName: _businessName.text,
                                    businessPhone: _businessPhone.text,
                                    trn: _trn.text,
                                    city: getCityId(),
                                    licenseExpiryDate: pickedDate.toString());
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
          ) :
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

  int getCityId() {
    int tempCityId = 0;
    for (int i = 0; i < _businessEditProfileProvider.getCitiesList().result.length; i++) {
      if (_selectedValue == _businessEditProfileProvider.getCitiesList().result[i].description) {
        tempCityId = _businessEditProfileProvider.getCitiesList().result[i].cityId;
        break;
      }
    }
    return tempCityId;
  }

  _showDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            cursorColor: Colors.grey,
            dialogBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(primary: AppColors.yellow),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
            textSelectionColor: Colors.grey,
          ),
          child: child,
        );
      },
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }
}
