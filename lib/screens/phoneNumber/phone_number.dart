import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number_components.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';

class PhoneNumber extends StatefulWidget {
  String tag;

  PhoneNumber({@required this.tag});

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  PhoneNumberComponents _phoneNumberComponents;
  PhoneNumberProvider _phoneNumberProvider;
  TextEditingController phone_number;
  bool onCheck = false;
  bool filled = false;

  @override
  void initState() {
    _phoneNumberProvider =
        Provider.of<PhoneNumberProvider>(context, listen: false);
    _phoneNumberComponents = PhoneNumberComponents();
    phone_number = TextEditingController();
    phone_number.addListener(() {
      if (phone_number.text.length > 0) {
        setState(() {
          filled = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PhoneNumberProvider>(context, listen: true);
    AppSizes.initializeSize(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          padding: EdgeInsets.only(
            left: AppSizes.width * 0.08,
            right: AppSizes.width * 0.08,
            top: AppSizes.width * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBar(
                  iconName: 'back_arrow_otp.png',
                  text: "",
                  clickableText: "",
                  onTap: () {},
                  onPress: () {
                    Navigator.pop(context, SlideRightRoute(page: CheckUser()));
                  }),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppSizes.height * 0.03,
                          ),
                          CommonWidgets.getHeadingText(
                            text: 'Enter Phone Number',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getSubHeadingText(text: "Phone Number"),
                          SizedBox(
                            height: 10,
                          ),
                          // CommonWidgets.getTextField(
                          //   isPassword: false,
                          //   leftIcon: Entypo.mobile,
                          //   textEditingController: phone_number,
                          //   hintText: "Phone Number",
                          //   filledField: filled
                          // ),
                          CommonWidgets.getPhoneNumberField(isPassword: false,
                              leftIcon: Entypo.mobile,
                              textEditingController: phone_number,
                              hintText: "Enter Phone Number",
                          ),
                          SizedBox(height: AppSizes.height * 0.03),
                          _getTermsAndCondition(),
                          SizedBox(height: 10),
                          CommonWidgets.getBottomButton(
                              text: "Next",
                              onPress: () {
                                _phoneNumberProvider.getPhoneNumber(
                                    context: context,
                                    phoneNumber: phone_number.text,
                                    tag: widget.tag,
                                    onCheck: onCheck);
                                // Navigator.push(context, SlideRightRoute(page: OTPAuthentication(tag: widget.tag,)));
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
              padding: EdgeInsets.only(top: 2),
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
                              _phoneNumberProvider.getTermsAndConditions(context: context);
                            })
                    ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
