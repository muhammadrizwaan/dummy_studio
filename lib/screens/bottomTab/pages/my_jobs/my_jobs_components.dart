
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';

class MyJobsComponents{

  Widget onSelectViewType({@required String text, @required Function onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.width * 0.03,
          vertical: AppSizes.width * 0.02,
        ),
        // width: AppSizes.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.yellow),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: 12,
            fontFamily: Assets.poppinsLight,
            color: AppColors.yellow,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget getJobContainer(
      {@required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String time,
        @required String status,
        @required Function onTap}) {
    return Container(
      // height: AppSizes.height * 0.05,
      // width: AppSizes.width,
      padding: EdgeInsets.all(AppSizes.width * 0.02),
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
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Job ID:',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' : ',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                jobDetail,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.height * 0.01,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage(Assets.df_pk_job),
                      height: 40,
                      width: 20,
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pickUpLocation,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.locationText,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.01,
                        ),
                        Text(
                          destinationLocation,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.locationText,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          startDate,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.dateColor,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.colorBlack,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: AppSizes.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.status,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                status,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vehicle Type:',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.status,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'Suzuki',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: Assets.poppinsMedium,
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: AppSizes.width * 0.01,
                  ),
                  GestureDetector(
                    onTap: () => onTap(),
                    child: Image(
                      image: AssetImage(Assets.informationIcon),
                      color: AppColors.colorBlack,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getSelectViewText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      child: Text(
        'Select View',
        style: TextStyle(
            fontSize: 14,
            fontFamily: Assets.poppinsLight,
            color: AppColors.colorBlack,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}