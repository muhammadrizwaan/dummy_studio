

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class IndividualProfileComponents{
  Widget getProfileImage({@required String profileImg}){
    return Container(
      child: CircleAvatar(
        backgroundImage: AssetImage(profileImg),
        radius: 50.0,
        backgroundColor: AppColors.white,
      ),
    );
  }

  Widget getIndividualProfileContainer(
      {
        @required String name,
        @required String email,
        @required String password,
      })
  {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
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
                // Container(
                //   // height: AppSizes.height * 0.05,
                //   width: AppSizes.width * 0.6,
                //   alignment: Alignment.centerRight,
                //   child: TextField(
                //     readOnly: true,
                //     textAlign: TextAlign.right,
                //     obscureText: true,
                //     // controller: textEditingController,
                //     decoration: InputDecoration(
                //       // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                //       hintText: password,
                //       border: InputBorder.none,
                //       hintStyle: TextStyle(
                //         decoration: TextDecoration.none,
                //         fontSize:12,
                //         fontFamily: Assets.poppinsLight,
                //         color: AppColors.profileTextColor,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

}