
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class IndividualEditProfileComponents{
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
}