

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class IndividualProfile extends StatefulWidget {
  @override
  _IndividualProfileState createState() => _IndividualProfileState();
}

class _IndividualProfileState extends State<IndividualProfile> {
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
              CommonWidgets.tabsAppBar1(
                  text: 'Profile',
                  iconName: Assets.editProfileIcon,
                  onPress: (){}
                  ),
              Divider(height: 10,),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.01,),
                          // _notificationsComponents.getNotificationsContainer(
                          //     leftIcon: Assets.profileImg,
                          //     userName: 'Ali Julie Holmes',
                          //     message: 'Your Driver is at Location.',
                          //     time: '3:41 PM'
                          // )

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
