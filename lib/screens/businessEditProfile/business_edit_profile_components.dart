

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class BusinessEditProfileComponents{
  Widget getProfileImage({@required String profileImg, @required Function onPress}){
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: AppSizes.height * 0.12,
        width: AppSizes.width * 0.24,
        child: CircleAvatar(
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => onPress(),
                    child: Image(
                      image: AssetImage(Assets.addProfileImg),
                    ),
                  )
              ),
            ],
          ),
          backgroundImage: AssetImage(profileImg),
          radius: 50.0,
          backgroundColor: AppColors.white,
        ),
      ),
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
          borderRadius: BorderRadius.circular(10),
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