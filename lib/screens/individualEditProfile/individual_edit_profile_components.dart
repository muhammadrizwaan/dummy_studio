
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
                  bottom: -8,
                  right: 5,
                  child: GestureDetector(
                    onTap: () => onPress(),
                    child: Container(
                      height: AppSizes.height * 0.06,
                      width: AppSizes.width * 0.06,
                      child: Image(
                        image: AssetImage(Assets.addProfileImg),
                      ),
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

  Widget getTabBarCross({
    @required String text,
    @required String image,
    @required Function onPress
  }) {
    return Container(
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      // color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: Assets.poppinsMedium,
              fontSize: 22,
              color: AppColors.colorBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => onPress(),
            child: Container(
              height: AppSizes.height*0.035,
              width: AppSizes.width*0.035,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                //color: AppColors.colorBlack.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}