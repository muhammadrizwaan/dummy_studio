

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

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
  Widget getImagePicker({
    @required Function onPress,
  }) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Center(
        child: DottedBorder(
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
              width: AppSizes.width * 0.82,
              height: AppSizes.height * 0.07,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(WebSymbols.plus_circle, size: 15, color: AppColors.colorBlack.withOpacity(0.9),),
                  TextView.getLabelText04(' Attach Copy of License', color: AppColors.colorBlack.withOpacity(0.4),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}