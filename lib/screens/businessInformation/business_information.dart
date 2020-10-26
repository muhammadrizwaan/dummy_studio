import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information_components.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/maps/maps_screen.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

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
          padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBar(
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
                              CommonWidgets.getHeading1Text(
                                  text: 'Business Information'),
                              _businessInformationComponents
                                  .getBusinessSignupStep()
                            ],
                          ),
                          // CommonWidgets.getHeading1Text(text: 'Signup'),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(text: "Business Name"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'name_icon.png',
                              textEditingController: business_name,
                              hintText: "Enter Business Name"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(text: "Contact Number"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'icon_phone_pn.png',
                              textEditingController: contact_number,
                              hintText: "Enter Contact Number"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(text: "TRN"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'password_icon.png',
                              textEditingController: trn,
                              hintText: "Enter TRN"),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getLableText(
                              text: "License Expiry Date"),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'license_icon.png',
                              textEditingController: license_date,
                              hintText: "09/22/2030"),

                          SizedBox(
                            height: 30,
                          ),
                          _businessInformationComponents.getImagePicker(
                              onPress: () {
                            // Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
                          }),
                          SizedBox(
                            height: 30,
                          ),

                          Container(
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
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
                                Container(
                                  width: AppSizes.width * 0.75,
                                  child: RichText(
                                    text: TextSpan(
                                        text:
                                            'By creating an account you agree to our ',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Term and Conditions',
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      Assets.poppinsRegular),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // navigate to desired screen
                                                })
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Table(
                          //   columnWidths: {0: FlexColumnWidth(0.15)},
                          //   children: [
                          //     TableRow(
                          //         children: [
                          //           Container(
                          //             alignment: Alignment.topLeft,
                          //             child: Checkbox(
                          //               checkColor: AppColors.white,
                          //               activeColor: AppColors.yellow,
                          //               value: onCheck,
                          //               onChanged: (bool value) {
                          //                 setState(() {
                          //                   onCheck = value;
                          //                 });
                          //               },
                          //             ),
                          //           ),
                          //           RichText(
                          //             text: TextSpan(
                          //                 text: 'By creating an account you agree to our ',
                          //                 style: TextStyle(
                          //                     color: Colors.black, fontSize: 12),
                          //                 children: <TextSpan>[
                          //                   TextSpan(text: 'Term and Conditions',
                          //                       style: TextStyle(
                          //                           color: Colors.amber,
                          //                           fontSize: 12,
                          //                           fontFamily: Assets.poppinsRegular
                          //
                          //                       ),
                          //                       recognizer: TapGestureRecognizer()
                          //                         ..onTap = () {
                          //                           // navigate to desired screen
                          //                         }
                          //                   )
                          //                 ]
                          //             ),
                          //           )
                          //         ]
                          //     )
                          //   ],
                          //
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          CommonWidgets.getBottomButton(
                              text: "Sign up",
                              onPress: () {
                                _alertDialogueContainer();
                              }),
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
                            "Signup successful !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.colorBlack,
                                fontFamily: Assets.poppinsMedium,
                                fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "Done",
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //       decoration: TextDecoration.none,
                          //       fontSize: 15,
                          //       color: AppColors.colorBlack,
                          //       fontFamily: Assets.poppinsMedium,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  SlideRightRoute(
                                      page: Maps(
                                    tag: widget.tag,
                                  )));
                            },
                            child: Text(
                              "Tap & Continue",
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
