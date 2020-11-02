import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile_components.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class BusinessProfile extends StatefulWidget {
  String tag;

  BusinessProfile({@required this.tag});

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  BusinessProfileComponents _businessProfileComponents;

  @override
  void initState() {
    super.initState();
    _businessProfileComponents = BusinessProfileComponents();
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
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.09,
                width: AppSizes.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.only(
                  left: AppSizes.width * 0.05,
                  right: AppSizes.width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _getBackButton(),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: AppColors.colorBlack,
                              fontFamily: Assets.poppinsMedium,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            widget.tag == Strings.indiviual ? Navigator.push(context, SlideRightRoute(page: IndividualEditProfile())) :
                            Navigator.push(context, SlideRightRoute(page: BusinessEditProfile()));
                          },
                          child: Icon(
                            FontAwesome5.edit,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSizes.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _businessProfileComponents.getProfileImage(
                              profileImg: Assets.profileImg),
                          SizedBox(
                            height: AppSizes.height * 0.05,
                          ),
                          _businessProfileComponents.getProfileLable(
                              lableText: "Basic Information"),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _businessProfileComponents
                              .getBusinessProfileContainer(
                                  name: 'Mathew Lawson',
                                  email: 'MathewLawson@gmail.com',
                                  password: '********',
                                  country: 'Costa Rica'),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          _businessProfileComponents.getProfileLable(
                              lableText: "Business Information"),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          _businessProfileComponents
                              .getBusinessInfoProfileContainer(
                                  businessName: 'Cargo Company',
                                  phoneNumber: '(351)205-2551',
                                  trn: '847-84584-8'),
                          // SizedBox(height: AppSizes.height * 0.03,),
                          Center(
                            child: Image(
                              image: AssetImage(Assets.licenceImg),
                              width: 400,
                              height: 200,
                            ),
                          )
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

  _getBackButton() {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: 25,
      ),
    );
  }
}
