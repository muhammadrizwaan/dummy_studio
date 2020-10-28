

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../res/colors.dart';
import '../../res/colors.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';
import '../../res/sizes.dart';
import '../../res/sizes.dart';
import '../../res/sizes.dart';
import '../../res/sizes.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  ContactUsComponents _contactUsComponents;

  @override
  void initState() {
    super.initState();
    _contactUsComponents = ContactUsComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.tabsAppBar2(
                      text: 'Contact Us',
                      onPress: (){
                        Navigator.pop(context);
                      }
                  ),
                  SizedBox(height: AppSizes.height * 0.03,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, vertical: AppSizes.height * 0.01),
                    child: CommonWidgets.getSubHeadingText(
                        text: 'Full Name'
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, ),
                    child: _contactUsComponents.getNameTextField(
                        leftIcon: Entypo.user,
                        hintText: 'Full Name',
                        textEditingController: null
                    ),
                  ),
                  SizedBox(height: AppSizes.height * 0.01,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, vertical: AppSizes.height * 0.01),
                    child: CommonWidgets.getSubHeadingText(
                        text: 'Message'
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, ),
                    child: _contactUsComponents.getMessageTextField(
                        leftIcon: Icons.message,
                        hintText: 'Message',
                        textEditingController: null
                    ),
                  ),
                  SizedBox(height: AppSizes.height * 0.05,),
                  Container(
                    height: AppSizes.height*0.1,
                    width: AppSizes.width,
                    padding: EdgeInsets.only(left: AppSizes.width*0.08),
                    child: Row(
                      children: [
                        Container(
                          width: AppSizes.width*0.40,
                          margin: EdgeInsets.only(right: AppSizes.width*0.05),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.yellow,),
                            borderRadius: BorderRadius.circular(05,),
                            color: AppColors.yellow,
                          ),
                          child: FlatButton(
                            onPressed: (){},
                            child: TextView.getBottomButtonText04("Send", color: Colors.white.withOpacity(0.6),),
                          ),
                        ),
                        Container(
                          width: AppSizes.width*0.40,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.yellow,),
                            borderRadius: BorderRadius.circular(05,),
                            color: Colors.white,
                          ),
                          child: FlatButton(
                            onPressed: (){},
                            child: TextView.getBottomButtonText04("Callback", color: AppColors.yellow.withOpacity(0.6),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
