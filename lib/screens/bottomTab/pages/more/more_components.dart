

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';

class MoreComponents{
  Widget touchableButton({@required String text, @required Function onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: AppSizes.height * 0.08,
        width: AppSizes.width,
        color: AppColors.white,
        padding: EdgeInsets.only(left: AppSizes.width * 0.08),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(width: AppSizes.width * 0.08,),
            TextView.getLabelText04(text, color: AppColors.colorBlack.withOpacity(0.6)),
          ],
        ),
      ),
    );
  }

  Widget getSOSbutton({@required String text, @required Function onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: AppSizes.height * 0.06,
        width: AppSizes.width,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.08),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(width: AppSizes.width * 0.08,),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontFamily: Assets.poppinsLight,
                color: AppColors.colorBlack,
                // fontWeight: FontWeight.bold
              ),
            ),
            Image(
              image: AssetImage(Assets.rightArrow),
            ),
          ],
        ),
      ),
    );
  }

  Widget getProfileContainer({
    @required Function onPress,
    @required String ProfileImg,
    @required String name,
    @required String email,
  }) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        // color: AppColors.yellow,
        padding: EdgeInsets.all(AppSizes.width * 0.05),
        child: Row(
          children: [
            SizedBox(
              width: AppSizes.width * 0.02,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(ProfileImg),
              radius: 50.0,
              backgroundColor: AppColors.white,
            ),
            // Image(image: AssetImage(Assets.profileImg),),
            SizedBox(
              width: AppSizes.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: Assets.robotoBold,
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.emailTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}