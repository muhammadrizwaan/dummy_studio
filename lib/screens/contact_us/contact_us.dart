

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

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
                      iconName: Assets.backArrow,
                      onPress: (){
                        Navigator.pop(context);
                      }
                  ),
                  Divider(height: 10,),
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
                        leftIcon: Assets.nameIcon,
                        hintText: 'Enter Full Name',
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
                        leftIcon: Assets.nameIcon,
                        hintText: 'Enter Message',
                        textEditingController: null
                    ),
                  ),
                  SizedBox(height: AppSizes.height * 0.05,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, ),
                    child: CommonWidgets.getBottomButton(
                        text: "Send",
                        onPress: (){}
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
