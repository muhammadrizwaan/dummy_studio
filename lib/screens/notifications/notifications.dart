

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
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
          // padding: EdgeInsets.all(AppSizes.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidgets.tabsAppBar2(
                      text: 'Notifications',
                      iconName: Assets.backArrow,
                      onPress: (){
                        Navigator.pop(context);
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Image(image: AssetImage(Assets.bellIconPressed),),
                  )
                ],
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
