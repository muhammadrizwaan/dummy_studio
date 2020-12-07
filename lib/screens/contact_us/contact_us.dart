

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
  TextEditingController email, message;
  ContactUsProvider _contactUsProvider;

  @override
  void initState() {
    super.initState();
    _contactUsComponents = ContactUsComponents();
    email = TextEditingController();
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
                        text: 'Full Name'
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, ),
                    child: _contactUsComponents.getNameTextField(
                        leftIcon: Entypo.user,
                        hintText: 'Mathew Lawson',
                        textEditingController: email
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
                        hintText: 'Ameris sed tu vig ga ine pu na sa. Le ba si diga ti na ishi ga su. Ini ta pi na kisi sat ly vei in the pie.',
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
                              _contactUsProvider.getContactUs(context: context, email: email.text, message: email.text);
                            },
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
                            onPressed: (){
                              _onPressCallBack();
                            },
                            child: TextView.getBottomButtonText04("Callback", color: AppColors.yellow),
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
  _onPressCallBack() {
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
                      height: AppSizes.height * 0.25,
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
                          Container(
                            padding: EdgeInsets.only(
                              left: AppSizes.height * 0.01, right: AppSizes.height * 0.01,
                            ),
                              child: TextView.getPopUpText(
                                  'Notification has sent to truckoom. They will contact soon',
                                  color: AppColors.black,
                              ),
                          ),
                          /*Text(
                            "Please give your E-Signature",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              color: AppColors.colorBlack,
                              fontFamily: Assets.poppinsMedium,),
                          ),*/
                          /*Container(
                            height: AppSizes.height * 0.06,
                            width: AppSizes.width,
                            alignment: Alignment.bottomLeft,
                            //margin: EdgeInsets.only(left:AppSizes.width*0.05,right:AppSizes.width*0.05,bottom: AppSizes.height*0.01),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontFamily: Assets.poppinsLight,
                                  fontSize: 12,
                                  color: AppColors.colorBlack
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Price",
                                hintStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                ),
                              ),
                            ),
                          ),*/
                          SizedBox(height: AppSizes.height * 0.03,),

                          GestureDetector(
                              onTap: () {
                                hideLoader(context);
                              },
                              child: Container(

                                margin: EdgeInsets.only(left:AppSizes.width*0.05,right:AppSizes.width*0.05),
                                width: AppSizes.width,
                                height: AppSizes.height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppColors.yellow,
                                  ),
                                  color: AppColors.yellow,
                                ),
                                child: Center(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: AppColors.white,
                                      fontFamily: Assets.poppinsLight,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.42),
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
                        Entypo.air,
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
    Navigator.of(context).pop();
  }

}
