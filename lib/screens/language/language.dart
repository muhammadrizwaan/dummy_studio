import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../res/colors.dart';
import '../../res/colors.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          padding: EdgeInsets.only(left: AppSizes.width * 0.08, right: AppSizes.width*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.25),
                          CommonWidgets.getHeadingText(
                              text: 'Choose Language'),
                          SizedBox(
                            height: 30,
                          ),
                          CommonWidgets.getSubHeadingText(text: "Select Language"),
                          SizedBox(
                            height: 10,
                          ),
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
                                  child: Icon(
                                    Icons.language,
                                    color: AppColors.colorBlack.withOpacity(0.75),
                                  ),
                                  // child: Image(image: AssetImage('assets/png/location_icon.png')),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                        value: _value,
                                        items: [
                                          DropdownMenuItem(
                                            child: TextView.getLightTextLanguage(
                                              "English",
                                              color: AppColors.colorBlack,
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                              child: TextView.getLightTextLanguage("Urdu", color: AppColors.colorBlack),
                                              value: 2),
                                          DropdownMenuItem(
                                              child: TextView.getLightTextLanguage( "Arabic", color: AppColors.colorBlack,),
                                              value: 3),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.08),
                          CommonWidgets.getBottomButton(
                              text: "Next",
                              onPress: () {
                                // Navigator.push(context, SlideRightRoute(page: BusinessInformation(tag: Strings.business, userId: 33, )));
                                Navigator.push(
                                    context, SlideRightRoute(page: Login()));
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
}
