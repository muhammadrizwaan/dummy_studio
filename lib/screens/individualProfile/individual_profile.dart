import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile_components.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class IndividualProfile extends StatefulWidget {
  String tag;

  IndividualProfile({@required this.tag});

  @override
  _IndividualProfileState createState() => _IndividualProfileState();
}

class _IndividualProfileState extends State<IndividualProfile> {
  IndividualProfileComponents _individualProfileComponents;

  @override
  void initState() {
    super.initState();
    _individualProfileComponents = IndividualProfileComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
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
                    left: AppSizes.width * 0.05, right: AppSizes.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _getBackButton(),
                        Text(
                          "Profile",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Assets.poppinsRegular,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _getEditButton(),
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
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.01,),
                          _individualProfileComponents.getProfileImage(
                              profileImg: Assets.profileImg
                          ),
                          SizedBox(height: AppSizes.height * 0.05,),
                          _individualProfileComponents
                              .getIndividualProfileContainer(
                              name: 'Mathew Lawson',
                              email: 'MathewLawson@gmail.com',
                              password: '********'
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
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios, size: 25,));
  }

  _getEditButton() {
    return GestureDetector(
        onTap: () {
          widget.tag == Strings.indiviual
              ? Navigator.push(
              context, SlideRightRoute(page: IndividualEditProfile()))
              : Navigator.push(
              context, SlideRightRoute(page: BusinessEditProfile()));
        },
        child: Icon(FontAwesome5.edit, size: 20,));
  }
}
