

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class PlacedComponents{

  Widget getJobContainer(
      {@required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String time,
        @required String status,
        @required String vehicleType,
        @required String price,
        @required Function onTap,
        @required Function onAlert,
      }) {
    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
        padding: EdgeInsets.all(AppSizes.width * 0.03),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderColor),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Job ID: ',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: Assets.poppinsMedium,
                          color: AppColors.yellow,
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
                Text(
                  price,
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage(Assets.df_pk_job),
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
                  Container(
                    height: AppSizes.height * 0.06,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: Assets.poppinsRegular,
                                color: AppColors.colorBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.01,
                        ),
                      ],
                    ),
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
                  'Status:',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.locationText,
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
                    color: AppColors.locationText,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    Text(
                      vehicleType,
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
                      onTap: () => onAlert(),
                      child: Icon(Octicons.info, size: 20, color: AppColors.colorBlack.withOpacity(0.70),),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}