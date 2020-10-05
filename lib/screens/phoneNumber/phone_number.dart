
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/screens/otpAuthentication/otp_authentication.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';
import '../../res/sizes.dart';

class PhoneNumber extends StatefulWidget {

  @override
  _PhoneNumberState createState() => _PhoneNumberState();

}

class _PhoneNumberState extends State<PhoneNumber> {
  PhoneNumberComponents _phoneNumberComponents;
  TextEditingController phone_number;
  bool onCheck = false;

  @override
  void initState() {
    _phoneNumberComponents = PhoneNumberComponents();
    phone_number = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.initializeSize(context);

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
              Positioned(
                top: 0,
                child: CommonWidgets.getAppBar(
                    iconName: 'back_arrow_otp.png',
                    text: "",
                    clickableText: "",
                    onTap: (){},
                    onPress: () {
                      Navigator.pop(context, SlideRightRoute(page: PhoneNumber()));
                    }),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonWidgets.getHeading1Text(text: 'Enter Phone Number'),
                          SizedBox(height: 30,),
                          CommonWidgets.getLableText(text: "Phone Number"),
                          SizedBox(height: 10,),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: 'icon_phone_pn.png',
                              textEditingController: phone_number,
                              hintText: "Enter Phone Number"
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
                              text: "Next",
                              onPress: () {
                                Navigator.push(context, SlideRightRoute(page: OTPAuthentication()));
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
