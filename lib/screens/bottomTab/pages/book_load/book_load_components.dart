

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class BookLoadComponents{
  Widget getLocationsList(){
    return Container();
  }

  Widget getLocationPickupText({@required String text}) {
    return Container(
      // margin: EdgeInsets.only(left: AppSizes.width * 0.03),
      child: Text(
        text,
        maxLines: 1,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: AppColors.colorBlack,
            fontSize: 14,
            fontFamily: Assets.poppinsMedium,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget getSlidingUpLine(){
    return Align(
      alignment: Alignment.center,
      child: Container(
          width: AppSizes.width * 0.40,
          height: AppSizes.height * 0.008,
          margin: EdgeInsets.only(bottom: AppSizes.height * 0.02),
          decoration: BoxDecoration(
              color: AppColors.dragContainer,
              borderRadius: BorderRadius.circular(10))),
    );
  }

  Widget getLocationImage(){
    return Container(
      height: AppSizes.height * 0.0975,
      padding: EdgeInsets.only(bottom: AppSizes.height * 0.008),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.yellow
            ),
          ),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey
            ),
          ),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey
            ),
          ),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey
            ),
          ),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey
            ),
          ),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey
            ),
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.yellow
            ),
          )
        ],
      ),
    );
    //   Container(
    //   height: AppSizes.height * 0.14,
    //   padding: EdgeInsets.only(top: AppSizes.height * 0.021, bottom: AppSizes.height * 0.03),
    //   child: Image.asset(Assets.joint, fit: BoxFit.cover,),
    // );
  }

  Widget getHorizontalLine(){
    return Container(
      height: AppSizes.height * 0.005,
      width: AppSizes.width,
      margin: EdgeInsets.only(top: AppSizes.height * 0.03),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
      ),
    );
  }

  Widget onLocationPickerButton({@required BuildContext context, @required Function onPress, @required String text, @required bool isSelected}){
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizes.width * 0.03,
        ),
        height: AppSizes.height * 0.06,
        width: AppSizes.width * 0.85,
        decoration: BoxDecoration(
            color: AppColors.lightGray,
            border: isSelected
                ? Border.all(color: AppColors.yellow)
                : Border.all(color: AppColors.yellow.withOpacity(0)),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Icon(
              Elusive.location,
              size: 20,
              color:
              AppColors.colorBlack.withOpacity(0.8),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: AppSizes.width * 0.7,
              child: TextView.getLocationTextField(
                text,
                color: AppColors.colorBlack
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHistroyText({
    @required BuildContext context,
    @required String text,
  }){
    return Container(
      height: AppSizes.height * 0.05,
      width: AppSizes.width * 0.85,
      margin: EdgeInsets.only(
        top: AppSizes.height * 0.02,
        // left: AppSizes.width * 0.04,
        right: AppSizes.width * 0.04,
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Icon(
                  Elusive.location,
                  size: 20,
                  color: AppColors.colorBlack.withOpacity(0.8),
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppSizes.width * 0.03,
          ),
          Container(
            color: AppColors.white,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontFamily: Assets.poppinsLight,
                color: AppColors.colorBlack,
              ),
            ),
          ),

        ],
      ),
    );
  }
}