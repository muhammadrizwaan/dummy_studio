import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';


class DriverDetailComponents {
  Widget getProfileImage({@required String profileImg}) {
    return Container(
      child: Center(
        child: CircleAvatar(
          backgroundImage: profileImg == ""?AssetImage(Assets.profileImg): NetworkImage('$baseUrl'+'$profileImg'),
          radius: 50.0,
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }

  Widget getBoxContainer({
    @required String name,
    @required String email,
    @required String phone_number,
    @required String License_number,
    @required String driverId
  }) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          // border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500].withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          // Container(
          //   padding: EdgeInsets.all(AppSizes.width * 0.02),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'Email',
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontFamily: Assets.poppinsLight,
          //           color: AppColors.profileTextColor,
          //           // fontWeight: FontWeight.bold
          //         ),
          //       ),
          //       Text(
          //         email,
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontFamily: Assets.poppinsLight,
          //           color: AppColors.profileTextColor,
          //           // fontWeight: FontWeight.bold
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Divider(
          //   height: 10,
          // ),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  phone_number,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'License Number',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  License_number,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(AppSizes.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Driver ID',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                    color: AppColors.profileTextColor,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  driverId,
                  style: TextStyle(
                    fontSize: 12,
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

  Widget getProfileLable({@required String lableText}) {
    return Text(
      lableText,
      style: TextStyle(
          fontSize: 16,
          fontFamily: Assets.poppinsBold,
          color: AppColors.colorBlack,
          fontWeight: FontWeight.bold),
    );
  }

  Widget getReviewsContainer(
      {@required String leftIcon,
      @required String onPressReview(),
      @required String userName,
      @required String message,
      @required String time,
        @required String ratings
      }) {
    return GestureDetector(
      onTap: () => onPressReview(),
      child: Container(
        // height: AppSizes.height * 0.05,
        margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.01),
        padding: EdgeInsets.all(AppSizes.width * 0.03),
        width: AppSizes.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            // border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[500].withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: leftIcon == ""?AssetImage(Assets.profileImg): NetworkImage('$baseUrl'+'$leftIcon'),
                  radius: 25.0,
                  // foregroundColor: AppColors.white,
                  backgroundColor: AppColors.yellow,
                ),
                SizedBox(
                  width: AppSizes.width * 0.03,
                ),
                Container(
                  width: AppSizes.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.colorBlack,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.01,
                      ),
                      Text(
                        message,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 10,
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
            Container(
              //height: AppSizes.height * 0.05,
              //width: AppSizes.width*0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: Assets.poppinsLight,
                      color: AppColors.profileTextColor,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.height * 0.01,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage(Assets.starIcon),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        ratings,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: Assets.poppinsLight,
                          color: AppColors.profileTextColor,
                          // fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
