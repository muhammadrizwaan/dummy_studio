

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class IndividualProfileComponents{
  Widget getProfileImage({@required String profileImg}){
    return Container(
      child: CircleAvatar(
        backgroundImage:profileImg != ""? NetworkImage(baseUrl+profileImg): AssetImage(Assets.profileImg),
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
      //height: AppSizes.height*0.2,
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
            height: AppSizes.height*0.05,
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Full Name',
                  style: TextStyle(
                      fontSize:12,
                      fontFamily: Assets.poppinsLight,
                      color: AppColors.profileTextColor,
                  ),
                ),
                Text(name,
                  style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 10,),
          Container(
            height: AppSizes.height*0.05,
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
            height: AppSizes.height*0.05,
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