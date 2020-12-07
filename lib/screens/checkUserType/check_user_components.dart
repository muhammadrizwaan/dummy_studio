

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class CheckUserComponents {

  Widget getBottomButton({@required String text, @required Function onPress, @required bool state}){
    return Container(
      width: AppSizes.width,
      height: AppSizes.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(color: state ? AppColors.yellow : Colors.grey,),
        color: state ? AppColors.yellow : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500].withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0,0)
          )
        ]
      ),
      child: FlatButton(
        onPressed: () => onPress(),
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 15,
            color: state ? AppColors.white: AppColors.colorBlack,
            fontFamily: Assets.poppinsLight,
          ),
        ),
      ),
    );
  }


}