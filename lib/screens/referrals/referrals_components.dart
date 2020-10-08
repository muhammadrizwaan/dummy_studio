

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class ReferralsComponents{
  Widget getReferralsText(){
    return Container(
      child: Text('Referrals Link',
        style: TextStyle(
          fontSize:14,
          fontFamily: Assets.poppinsRegular,
          color: AppColors.colorBlack,
          // fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget getLinkField(
      { @required String leftIcon, @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.06,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          prefixIcon: Image(image: AssetImage('$leftIcon')) ,
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
    );
  }
}