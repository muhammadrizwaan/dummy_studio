

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class CommonWidgets{

  static Widget getBottomButton({@required String text, @required Function onPress}){
    return Container(
      width: AppSizes.width,
      height: AppSizes.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.yellow,),
        color: AppColors.yellow,
      ),
      child: FlatButton(
        onPressed: () => onPress(),
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 15,
            color: AppColors.white,
            fontFamily: Assets.poppinsLight,
          ),
        ),
      ),
    );
  }

  static Widget getAppBar({@required String text, @required String iconName, @required String clickableText, @required Function onPress, @required Function onTap}){
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => onPress(),
              child: Image(image: AssetImage('assets/png/$iconName'))
          ),

          RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: Assets.poppinsRegular
              ),
              children: <TextSpan>[
                TextSpan(text: clickableText,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 12,
                      fontFamily: Assets.poppinsRegular

                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => onTap(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget tabsAppBar1({@required String text, @required String iconName, @required Function onPress}){
    return Container(
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      // color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: Assets.poppinsMedium,
              fontSize: 22,
              color: AppColors.colorBlack
            ),
          ),
          GestureDetector(
              onTap: () => onPress(),
              child: Image(image: AssetImage('$iconName'))
          ),
        ],
      ),
    );
  }
  static Widget tabsAppBar2({@required String text, @required String iconName, @required Function onPress}){
    return Container(
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      // color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () => onPress(),
              child: Image(image: AssetImage('$iconName'))
          ),
          SizedBox(width: 20,),
          Text(
            text,
            style: TextStyle(
                fontFamily: Assets.poppinsMedium,
                fontSize: 22,
                color: AppColors.colorBlack
            ),
          ),
        ],
      ),
    );
  }

  static Widget getHeading1Text({@required String text}) {
    return Container(
      // margin: EdgeInsets.only(left: AppSizes.width * 0.03),
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.colorBlack,
          fontSize: 20,
          fontFamily: Assets.poppinsRegular,
        ),
      ),
    );
  }

  static Widget getLableText({@required String text}){
    return Container(
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.colorBlack,
          fontSize: 14,
          fontFamily: Assets.poppinsRegular,
        ),
      ),
    );
  }

  static Widget getTextField(
      {@required bool isPassword, @required String leftIcon,@required TextEditingController textEditingController, @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.06,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: textEditingController,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Image(image: AssetImage('assets/png/$leftIcon')) ,
          suffixIcon: Image(image: AssetImage('assets/png/check_circle_fill_pn.png')) ,
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
            fontFamily: Assets.poppinsLight,
          ),
        ),
      ),
    );
  }

  static Widget getWalletPriceBox({@required String walletPrice}){
    return Container(
      width: AppSizes.width,
      height: AppSizes.height * 0.1,
      color: AppColors.lightGrayBackgroundColor,
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('AED',
            style: TextStyle(
              fontSize: 15,
              fontFamily: Assets.poppinsRegular,
              color: AppColors.yellow,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Text(walletPrice,
            style: TextStyle(
                fontSize: 28,
                fontFamily: Assets.poppinsRegular,
                color: AppColors.colorBlack,
                // fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

}