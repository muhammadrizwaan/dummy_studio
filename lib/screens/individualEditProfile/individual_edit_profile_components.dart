
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
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
          backgroundImage: profileImg != ""? NetworkImage(baseUrl+profileImg): AssetImage(Assets.profileImg),
          radius: 50.0,
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }

  Widget getTextField(
      {@required bool isPassword,
        @required IconData leftIcon,
        @required TextEditingController textEditingController,
        @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.07,
      width: AppSizes.width * 0.85,
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
          Opacity(
              opacity: 0.7,
              child: Icon(
                leftIcon,
                size: 20,
              )),
          Center(
            child: Container(
              // color: AppColors.yellow,
              padding: EdgeInsets.only(left: 5),
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