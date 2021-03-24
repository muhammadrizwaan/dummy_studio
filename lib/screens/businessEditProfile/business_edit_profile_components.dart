

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class BusinessEditProfileComponents{
  Widget getProfileImage({@required String profileImg, @required Function onPress}){
    return Align(
      alignment: Alignment.center,
      child: Container(
        // height: AppSizes.height * 0.12,
        // width: AppSizes.width * 0.24,
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
          backgroundImage: profileImg != ""? NetworkImage(baseUrl+profileImg): AssetImage(Assets.profileImg),
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
          TextView.getAppBarText(text, color: AppColors.colorBlack),
          // Text(
          //   text,
          //   style: TextStyle(
          //     fontFamily: Assets.poppinsMedium,
          //     fontSize: 22,
          //     color: AppColors.colorBlack,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
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

  Widget getDateField({@required String date, @required Function onDate}) {
    return GestureDetector(
      onTap: () => onDate(),
      child: Container(
        height: AppSizes.height * 0.07,
        width: AppSizes.width,
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
            Container(
              height: AppSizes.height * 0.06,
              width: AppSizes.width * 0.06,
              child: Image.asset(
                Assets.licenseExpiryIcon,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 5),
                width: AppSizes.width * 0.6,
                child:
                TextView.getLabel2Text04(date, color: AppColors.colorBlack),
              ),
            ),
            Container(
              height: AppSizes.height * 0.035,
              width: AppSizes.width * 0.085,
              child: Image(
                  image: AssetImage('assets/png/check_circle_fill_pn.png')),),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      {@required bool isPassword,
        @required String image,
        @required TextEditingController textEditingController,
        @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.07,
      width: AppSizes.width * 0.85,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: AppSizes.height * 0.06,
            width: AppSizes.width * 0.06,
            child: Image.asset(
              image,
            ),
          ),
          Center(
            child: Container(
              // color: AppColors.yellow,
              padding: EdgeInsets.only(left: 5),
              width: AppSizes.width * 0.6,
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
                readOnly: true,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: AppSizes.height * 0.035,
              width: AppSizes.width * 0.085,
              child: Image(
                  image: AssetImage(
                      'assets/png/check_circle_fill_pn.png'))),
        ],
      ),
    );
  }

}