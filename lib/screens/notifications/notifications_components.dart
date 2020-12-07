import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class NotificationsComponents {
  Widget getNotificationsContainer({
    @required String leftIcon,
    @required String userName,
    @required String message,
    @required String time,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      padding: EdgeInsets.all(AppSizes.width * 0.02),
      width: AppSizes.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500].withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(leftIcon),
                radius: 25.0,
                // foregroundColor: AppColors.white,
                backgroundColor: AppColors.yellow,
              ),
              SizedBox(
                width: AppSizes.width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: AppSizes.height * 0.01,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: Assets.poppinsLight,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: AppSizes.height * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.colorBlack,
                  ),
                ),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget NotificationAppBar(
      { @required String heading,
        @required Function onTap,
        @required Function onBellTap
      }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0,3)
          )
        ]
      ),
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      margin: EdgeInsets.only(bottom: AppSizes.height * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () => onTap(),
                  child: Container(
                    height: AppSizes.height*0.04,
                    width: AppSizes.width*0.04,
                    child: Image.asset(
                      'assets/png/back_arrow_otp.png',
                    ),
                  )),
              SizedBox(width: AppSizes.width * 0.05),
              TextView.getAppBarText(heading, color: AppColors.colorBlack)
            ],
          ),
          GestureDetector(
            onTap: ()=> onBellTap(),
            child: Icon(
              FontAwesome5.bell,
              size: 25,
              color: AppColors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
