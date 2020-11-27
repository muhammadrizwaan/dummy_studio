

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class ReferralsComponents{

  Widget getLinkField(
      { @required String leftIcon, @required String hintText}) {
    return DottedBorder(
      color: AppColors.addVehicleBorderColor,
      // dashPattern: [6, 3, 2, 3],
      strokeWidth: 1,
      borderType: BorderType.RRect,
      radius: Radius.circular(5),
      // padding: EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius:
        BorderRadius.all(Radius.circular(5)),
        child: Container(
          width: AppSizes.width,
          height: AppSizes.height * 0.06,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: AppColors.lightGray,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Entypo.attach, size: 16,),
              Container(
                // color: AppColors.yellow,
                height: AppSizes.height * 0.06,
                width: AppSizes.width * 0.75,
                padding: EdgeInsets.only(bottom: 7),
                margin: EdgeInsets.only(left: 5),
                child: TextField(
                  // style: ,
                  readOnly: true,
                  decoration: InputDecoration(
                    // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 12,
                      color: AppColors.colorBlack,
                      fontFamily: Assets.poppinsLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}