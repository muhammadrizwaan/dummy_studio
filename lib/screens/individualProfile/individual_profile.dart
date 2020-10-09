

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class IndividualProfile extends StatefulWidget {
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
          color: AppColors.white,
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidgets.tabsAppBar2(
                      text: 'Profile',
                      iconName: Assets.backArrow,
                      onPress: (){
                        Navigator.pop(context);
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, SlideRightRoute(page: IndividualEditProfile()));
                      },
                        child: Image(image: AssetImage(Assets.editProfileIcon),)
                    ),
                  )
                ],
              ),
              Divider(height: 10,),
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
