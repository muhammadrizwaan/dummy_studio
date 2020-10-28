

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
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
              Container(
                height: AppSizes.height * 0.09,
                width: AppSizes.width,
                padding: EdgeInsets.only(
                    left: AppSizes.width * 0.05, right: AppSizes.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _getBackButton(),
                        Text(
                          "Notifications",
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
        },
        child: Icon(FontAwesome5.bell, size: 20, color: AppColors.yellow,));
  }

}
