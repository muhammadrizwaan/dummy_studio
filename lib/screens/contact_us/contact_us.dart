

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us_components.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us_provider.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import 'package:provider/provider.dart';
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
  TextEditingController name, message;
  ContactUsProvider _contactUsProvider;

  @override
  void initState() {
    super.initState();
    _contactUsComponents = ContactUsComponents();
    name = TextEditingController();
    message = TextEditingController();
    _contactUsProvider = Provider.of<ContactUsProvider>(context, listen: false);
    _contactUsProvider.init(context: context);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<ContactUsProvider>(context, listen: false);
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
                        text: 'Subject'
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, ),
                    child: _contactUsComponents.getNameTextField(
                        image: Assets.userNameIcon,
                        hintText: 'Enter Subject',
                        textEditingController: name
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
                        image: Assets.descriptionbookIcon,
                        hintText: 'Enter Message',
                        textEditingController: message
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
                            onPressed: (){
                              _contactUsProvider.getContactUs(
                                  context: context,
                                  name: name.text,
                                  message: message.text,
                                  callbackStatus: 0
                              );
                            },
                            child: TextView.getDescriptionText("Send", color: AppColors.white,),
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
                            onPressed: (){
                              _contactUsProvider.getContactUs(
                                  context: context,
                                  name: name.text,
                                  message: message.text,
                                  callbackStatus: 1
                              );
                            },
                            child: TextView.getDescriptionText("Request Callback", color: AppColors.yellow),
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
