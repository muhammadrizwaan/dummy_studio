
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class BusinessInformationComponents {
  Widget getBusinessSignupStep(){
    return Row(
      children: [
        Text('Step ',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.grey,
          ),
        ),
        Text('02',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.yellow,
          ),
        ),
      ],
    );
  }

  Widget getImagePicker({@required Function onPress,}){
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: AppSizes.height * 0.06,
        width: AppSizes.width,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(5),
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/png/plus_icon.png')),
              Text(' Attach Copy of License',
                style: TextStyle(
                  fontFamily: Assets.poppinsMedium,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                ),
              )
        ],
      ),
      ),
    );
  }
}