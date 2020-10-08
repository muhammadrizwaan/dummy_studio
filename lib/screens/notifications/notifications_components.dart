

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class NotificationsComponents {

  Widget getNotificationsContainer(
      { @required String leftIcon, @required String userName, @required String message, @required String time}) {
    return Container(
        // height: AppSizes.height * 0.05,
          margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
          padding: EdgeInsets.all(AppSizes.width * 0.02),
          width: AppSizes.width,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
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
              // Image(image: AssetImage('$leftIcon'),
              //   width: 50,
              //   height: 50,
              // ) ,
              SizedBox(width: AppSizes.width * 0.03,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName,
                    style: TextStyle(
                      fontSize:12,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.colorBlack,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: AppSizes.height * 0.01,),
                  Text(message,
                    style: TextStyle(
                      fontSize:10,
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
                Text(time,
                  style: TextStyle(
                    fontSize:10,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.colorBlack,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: AppSizes.height * 0.01,),
              ],
            ),
          )
        ],
      ),
    );
  }
}