
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
        height: AppSizes.height * 0.07,
        width: AppSizes.width*0.85,
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
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                ),
              )
        ],
      ),
      ),
    );
  }

  Widget getTextField(
      {@required bool isPassword,
        @required String leftIcon,
        @required TextEditingController textEditingController,
        @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.07,
      width: AppSizes.width*0.85,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(leftIcon),
          Center(
            child: Container(
              // color: AppColors.yellow,
              width: AppSizes.width * 0.65,
              // height: AppSizes.height * 0.05,
              child: TextField(
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                ),
                controller: textEditingController,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 13,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
              ),
            ),
          ),
          Image(image: AssetImage('assets/png/check_circle_fill_pn.png')),
        ],
      ),
    );
  }
}