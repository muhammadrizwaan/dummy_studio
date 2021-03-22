

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs.dart';
import 'package:truckoom_shipper/screens/notifications/notifications_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}


class _NotificationsState extends State<Notifications> {
  NotificationsComponents _notificationsComponents;

  @override
  void initState() {
    _notificationsComponents = NotificationsComponents();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _notificationsComponents.NotificationAppBar(
                  heading: Strings.notification,
                  onTap: (){
                    Navigator.pop(context);
                  },
                  onBellTap: (){}
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
                          _notificationsComponents.getNotificationsContainer(
                              leftIcon: Assets.profileImg,
                              userName: 'Ali Julie Holmes',
                              message: 'Your Driver is at Location.',
                              time: '3:41 PM'
                          ),
                          SizedBox(height: AppSizes.height * 0.01,),
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
