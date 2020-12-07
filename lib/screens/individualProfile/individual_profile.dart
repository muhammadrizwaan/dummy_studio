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
              CommonWidgets.ProfileAppBar(
                  heading: Strings.profile,
                  onTap: (){Navigator.pop(context);},
                  onBellTap: (){
                    Navigator.push(context, SlideRightRoute(page: IndividualEditProfile()));
                    // widget.tag == Strings.indiviual
                    //     ? Navigator.push(context, SlideRightRoute(page: IndividualEditProfile()))
                    //     : Navigator.push(
                    //     context, SlideRightRoute(page: BusinessEditProfile()));
                  }
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
                          _individualProfileComponents.getIndividualProfileContainer(
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

}
