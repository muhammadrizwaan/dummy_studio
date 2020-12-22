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
import 'package:truckoom_shipper/screens/businessInformation/business_information_provider.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:provider/provider.dart';
import '../../animations/slide_right.dart';
import '../bottomTab/bottom_tab.dart';

class BusinessInformation extends StatefulWidget {
  int userId;

  BusinessInformation({@required this.userId});

  @override
  _BusinessInformationState createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  BusinessInformationComponents _businessInformationComponents;
  BusinessInformationProvider _businessInformationProvider;
  TextEditingController business_name, contact_number, trn;

  bool onCheck = false;
  DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    _businessInformationComponents = BusinessInformationComponents();
    _businessInformationProvider =
        Provider.of<BusinessInformationProvider>(context, listen: false);
    business_name = TextEditingController();
    contact_number = TextEditingController();
    trn = TextEditingController();
    pickedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BusinessInformationProvider>(context, listen: true);
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
              top: AppSizes.width * 0.08),
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
                          CommonWidgets.getSubHeadingText(
                              text: "Business Name"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: business_name,
                              hintText: "Enter Business Name"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(
                              text: "Contact Number"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getPhoneNumberField(
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
                          _businessInformationComponents.getDateField(
                              onDate: () {
                                _showDate();
                              },
                              date:
                                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
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
                                // _showDate();
                                _businessInformationProvider
                                    .getBusinessInformation(
                                        context: context,
                                        businessName: business_name.text,
                                        phoneNumber: contact_number.text,
                                        trn: trn.text,
                                        licenseExpiryDate: pickedDate,
                                        userId: widget.userId,
                                        onCheck: onCheck);
                                // _businessInformationProvider.getImage(
                                //     context: context);
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
