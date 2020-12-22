

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class BusinessProfileComponents{
  Widget getProfileImage({@required String profileImg}){
    return Container(
      child: Center(
        child: CircleAvatar(
          backgroundImage: profileImg != ""? NetworkImage(baseUrl+profileImg): AssetImage(Assets.profileImg),
          radius: 50.0,
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }

  Widget getBusinessProfileContainer(
      {
        @required String name,
        @required String email,
        @required String password,
        @required String country,
      })
  {
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey[500].withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: AppColors.borderColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Full Name',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(name,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 10,),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(email,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 10,),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Password',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(password,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 10,),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('City',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(country,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getProfileLable({@required String lableText}){
    return Text(lableText,
      style: TextStyle(
        fontSize:15,
        fontFamily: Assets.poppinsRegular,
        color: AppColors.colorBlack,
        // fontWeight: FontWeight.bold
      ),
    );
  }

  Widget getBusinessInfoProfileContainer(
      {
        @required String businessName,
        @required String phoneNumber,
        @required String trn,
        @required String licenseExpiryDate
      })
  {
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey[500].withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: AppColors.borderColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Business Name',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(businessName,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 10,),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Contact Number',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(phoneNumber,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 10,),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TRN Number',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(trn,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 10,),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('License Expiry Date',
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(licenseExpiryDate,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}