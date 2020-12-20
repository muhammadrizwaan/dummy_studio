import 'package:circulardropdownmenu/circulardropdownmenu.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/cities_response.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup_components.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup_provider.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/network/api_urls.dart';

class BusinessSignup extends StatefulWidget {
  String tag, cell;

  BusinessSignup({@required this.tag, @required this.cell});

  @override
  _BusinessSignupState createState() => _BusinessSignupState();
}

class _BusinessSignupState extends State<BusinessSignup> {
  BusinessSignupComponents _businessSignupComponents;
  TextEditingController name, email, password, confirm_Password;
  BusinessSignupProvider _businessSignupProvider;
  CustomPopup _loader = CustomPopup();
  bool onCheck = false;
  String _selectedValue;


  @override
  void initState() {
    _businessSignupComponents = BusinessSignupComponents();
    _businessSignupProvider = Provider.of<BusinessSignupProvider>(context, listen: false);
    _businessSignupProvider.init(context: context);
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirm_Password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BusinessSignupProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.only(
            left: AppSizes.width * 0.08,
            right: AppSizes.width * 0.08,
            top: AppSizes.width * 0.08,
          ),
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: _businessSignupProvider.isDataFetched? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.getAppBarCross(
                text: "Already have an account? ",
                iconName: 'cross_icon.png',
                clickableText: "Login",
                onPress: () {
                  Navigator.pop(context);
                },
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: Login()));
                },),
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
                              CommonWidgets.getHeadingText(text: 'Signup'),
                              _businessSignupComponents.getBusinessSignupStep()
                            ],
                          ),
                          // CommonWidgets.getHeading1Text(text: 'Signup'),
                          SizedBox(height: AppSizes.height * 0.04),
                          CommonWidgets.getSubHeadingText(text: "Full Name"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Entypo.user,
                              textEditingController: name,
                              hintText: "Enter Name"
                          ),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "Email"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: false,
                              leftIcon: Icons.mail,
                              textEditingController: email,
                              hintText: "Email"),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "Password"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
                              textEditingController: password,
                              hintText: "Enter Password"
                          ),

                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(
                              text: "Confirm Password"),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getTextField(
                              isPassword: true,
                              leftIcon: Entypo.lock,
                              textEditingController: confirm_Password,
                              hintText: "Confirm Password"
                          ),
                          SizedBox(height: AppSizes.height * 0.02),
                          CommonWidgets.getSubHeadingText(text: "City"),
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
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Elusive.location,
                                  size: 20,
                                  color:
                                  AppColors.colorBlack.withOpacity(0.8),
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    isExpanded: true,
                                    value: _selectedValue,
                                    hint: TextView.getLightText04(
                                      "Select City",
                                      color: AppColors.colorBlack,
                                    ),
                                    items: _businessSignupProvider.description
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

                          SizedBox(height: AppSizes.height * 0.02),
                          _getTermsAndCondition(),
                          SizedBox(height: AppSizes.height * 0.01),
                          CommonWidgets.getBottomButton(
                              text: "Next",
                              onPress: () {
                                _businessSignupProvider.getBusinessSignup(
                                  context: context,
                                  cell: widget.cell,
                                  tag: widget.tag,
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  confirmPassword: confirm_Password.text,
                                  city: getCityId(),
                                  onCheck: onCheck,
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

  int getCityId() {
    int tempCityId = 0;
    for (int i = 0; i < _businessSignupProvider.getCitiesList().result.length; i++) {
      if (_selectedValue == _businessSignupProvider.getCitiesList().result[i].description) {
        tempCityId = _businessSignupProvider.getCitiesList().result[i].cityId;
        break;
      }
    }
    return tempCityId;
  }
}
