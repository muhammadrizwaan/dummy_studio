

import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class DeliveredComponents{
  Widget getJobContainer(
      {@required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String endDate,
        @required String startTime,
        @required String endTime,
        @required String status,
        @required String vehicleType,
        @required String vehicleCategory,
        @required String price,
        @required bool isRated,
        @required Function onClickPay,
        @required Function onLoadDetail,
        @required Function onVehicleType,
        @required Function onVehicleCategory,
        @required Function onReviews,
      }) {
    return GestureDetector(
      onTap: ()=> onLoadDetail(),
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
                      'Load ID: ',
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
                      CommonWidgets.getLocationPointers(),
                      SizedBox(
                        width: AppSizes.width * 0.01,
                      ),
                      Container(
                        width: AppSizes.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pickUpLocation,
                              maxLines: 1,
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
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: Assets.poppinsRegular,
                                color: AppColors.locationText,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            DateTimeFormat.format(DateTime.parse(startDate), format: 'M j, Y'),
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
                            DateTimeFormat.format(DateTime.parse(startTime), format: r'g:i a'),
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
                      Row(
                        children: [
                          Text(
                            DateTimeFormat.format(DateTime.parse(endDate), format: 'M j, Y'),
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
                            DateTimeFormat.format(DateTime.parse(endTime), format: r'g:i a'),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Assets.poppinsRegular,
                              color: AppColors.colorBlack,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
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
                      onTap: () => onVehicleType(),
                      child: Icon(Octicons.info, size: 20, color: AppColors.colorBlack.withOpacity(0.70),),
                    ),
                  ],
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
                  'Vehicle Category:',
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
                      vehicleCategory,
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
                      onTap: () => onVehicleCategory(),
                      child: Icon(Octicons.info, size: 20, color: AppColors.colorBlack.withOpacity(0.70),),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            isRated?
                Container():
            Container(
              width: AppSizes.width,
              height: AppSizes.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.yellow,
                ),
                color: AppColors.yellow,
              ),
              child: FlatButton(
                onPressed: () => onReviews(),
                child: TextView.getLabelText04(
                  "Ratings & Reviews",
                  color: AppColors.white.withOpacity(0.95),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHistoryContainer({
    @required String jobDetail,
    @required String pickUpLocation,
    @required String destinationLocation,
    @required String startDate,
    @required String endDate,
    @required String price,
    @required String status,
    @required String vehicleType,
    @required String vehicleCategory,
    @required String startTime,
    @required String endTime,
    @required Function onInvoice,
    @required Function onTap,
    @required Function onDetail
  }) {
    return GestureDetector(
      onTap: () => onDetail(),
      child: Container(
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
                      CommonWidgets.getLocationPointers(),
                      SizedBox(
                        width: AppSizes.width * 0.01,
                      ),
                      Container(
                        width: AppSizes.width * 0.53,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pickUpLocation,
                              maxLines: 1,
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
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: Assets.poppinsRegular,
                                color: AppColors.locationText,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            DateTimeFormat.format(DateTime.parse(startDate), format: 'M j, Y'),
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
                            DateTimeFormat.format(DateTime.parse(startTime), format: r'g:i a'),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Assets.poppinsRegular,
                              color: AppColors.colorBlack,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            DateTimeFormat.format(DateTime.parse(endDate), format: 'M j, Y'),
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
                          DateTimeFormat.format(DateTime.parse(endTime), format: r'g:i a'),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Assets.poppinsRegular,
                              color: AppColors.colorBlack,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: AppSizes.height * 0.01),
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
                  'Vehicle Category:',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.locationText,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  vehicleCategory,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: Assets.poppinsMedium,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: () => onTap(),
                      child:Icon(Octicons.info, size: 20, color: AppColors.colorBlack.withOpacity(0.70),),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
              width: AppSizes.width,
              height: AppSizes.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.yellow,
                ),
                color: AppColors.yellow,
              ),
              child: FlatButton(
                onPressed: () => onInvoice(),
                child: Text(
                  'View Invoice',
                  // text,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                    color: AppColors.white,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}