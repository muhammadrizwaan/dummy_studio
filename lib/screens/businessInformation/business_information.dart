
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
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class BusinessInformation extends StatefulWidget {
  @override
  _BusinessInformationState createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  BusinessInformationComponents _businessInformationComponents;
  TextEditingController business_name, contact_number, trn ;
  bool onCheck = false;

  @override
  void initState() {
    super.initState();
    _businessInformationComponents = BusinessInformationComponents();
    business_name = TextEditingController();
    contact_number = TextEditingController();
    trn = TextEditingController();
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
                              CommonWidgets.getHeading1Text(text: 'Business Information'),
                              _businessInformationComponents.getBusinessSignupStep()
                            ],
                          ),
                          // CommonWidgets.getHeading1Text(text: 'Signup'),
                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Business Name"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'name_icon.png',
                              textEditingController: business_name,
                              hintText: "Enter Business Name"
                          ),
                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Contact Number"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'icon_phone_pn.png',
                              textEditingController: contact_number,
                              hintText: "Enter Contact Number"
                          ),
                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "TRN"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: 'password_icon.png',
                              textEditingController: trn,
                              hintText: "Enter TRN"
                          ),

                          SizedBox(height: 30,),
                          _businessInformationComponents.getImagePicker(
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
                              }
                          ),
                          SizedBox(height: 30,),

                          Table(
                            columnWidths: {0: FlexColumnWidth(0.15)},
                            children: [
                              TableRow(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
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
                          CommonWidgets.getBottomButton(
                              text: "Submit",
                              onPress: () {
                                CommonWidgets.getAlertDialouge(context: context, child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your Signup is successfully Done",
                                      style:
                                      TextStyle(color: AppColors.black,letterSpacing: 0.4),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: AppSizes.height*0.06),
                                        child: Text(
                                          "Click and Continue",
                                          style: TextStyle(
                                              color: AppColors.yellow,fontSize: 12
                                          ),),
                                      ),
                                    ),

                                  ],
                                ), text: null);
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
