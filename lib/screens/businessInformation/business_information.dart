import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information_components.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import '../../animations/slide_right.dart';
import '../bottomTab/bottom_tab.dart';

class BusinessInformation extends StatefulWidget {
  String tag;

  BusinessInformation({@required this.tag});

  @override
  _BusinessInformationState createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  BusinessInformationComponents _businessInformationComponents;
  TextEditingController business_name, contact_number, trn, license_date;

  bool onCheck = false;

  @override
  void initState() {
    super.initState();
    _businessInformationComponents = BusinessInformationComponents();
    business_name = TextEditingController();
    contact_number = TextEditingController();
    trn = TextEditingController();
    license_date = TextEditingController();
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
          padding: EdgeInsets.only(left: AppSizes.width * 0.08, right: AppSizes.width*0.08, top: AppSizes.width*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBarCross(
                  iconName: 'cross_icon.png',
                  text: "Already have an account? ",
                  clickableText: "Login",
                  onTap: () {
                    Navigator.push(context, SlideRightRoute(page: Login()));
                  },
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
                              CommonWidgets.getHeadingText(
                                  text: 'Business Information'),
                              _businessInformationComponents
                                  .getBusinessSignupStep()
                            ],
                          ),
                          // CommonWidgets.getHeading1Text(text: 'Signup'),
                          SizedBox(height: AppSizes.height * 0.04),
                          CommonWidgets.getSubHeadingText(text: "Business Name"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: business_name,
                              hintText: "Enter Business Name"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "Contact Number"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.mobile,
                              textEditingController: contact_number,
                              hintText: "Enter Contact Number"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "TRN"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.mobile,
                              textEditingController: trn,
                              hintText: "Enter TRN"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(
                              text: "License Expiry Date"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: LineariconsFree.license,
                              textEditingController: license_date,
                              hintText: "09/22/2030"),
                         /* _businessInformationComponents.getTextField(
                              isPassword: true,
                              textEditingController: license_date,
                              hintText: "09/22/2030"
                          ),*/
                          SizedBox(height: AppSizes.height * 0.03),
                          _businessInformationComponents.getImagePicker(
                              onPress: () {
                            // Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
                          }),
                          SizedBox(height: AppSizes.height * 0.02),
                          _getTermsAndCondition(),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getBottomButton(
                              text: "Signup",
                              onPress: () {
                                _alertDialogueContainer();
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
              child: RichText(
                text: TextSpan(
                    text: 'By creating an account, you agree to our. ',
                    style: TextStyle(
                      wordSpacing: 0.5,
                      color: Colors.black,
                      fontSize: 13,
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
                              // navigate to desired screen
                            })
                    ]),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _alertDialogueContainer() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.12,
                        right: AppSizes.width * 0.12,
                        top: AppSizes.width * 0.07,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.08,
                      ),
                      height: AppSizes.height * 0.2,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Signup Successful",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: AppColors.colorBlack,
                                fontFamily: Assets.poppinsMedium,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  SlideRightRoute(
                                      page: BottomTab(tag: widget.tag)),
                                      (Route<dynamic> route) => false);
                            },
                            child: Text(
                              "Tap to Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 12,
                                  color: AppColors.yellow,
                                  fontFamily: Assets.poppinsRegular,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  hideLoader(BuildContext context) {
    Navigator.push(context, SlideRightRoute(page: BusinessProfile()));
  }
}
