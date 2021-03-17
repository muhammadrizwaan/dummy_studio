import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class InProcessComponents {
  Widget getJobContainer(
      {@required BuildContext context,
      @required String jobDetail,
      @required String pickUpLocation,
      @required String destinationLocation,
      @required String startDate,
      @required String time,
      @required String status,
      @required String vehicleType,
        @required String vehicleCategory,
      @required String price,
        @required int statusId,
      @required Function onTap,
      @required Function onAlert,
      @required Function onDriverDetail}) {
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
                  Container(
                    height: AppSizes.height * 0.06,
                    child: Column(
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
                              DateTimeFormat.format(DateTime.parse(time), format: r'g:i a'),
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
                      color: AppColors.colorBlack,
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
                      onTap: ()=> onAlert(),
                      child: Icon(
                        Octicons.info,
                        size: 20,
                        color: AppColors.colorBlack.withOpacity(0.70),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            statusId == 5?
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
                onPressed: () => onDriverDetail(),
                child: TextView.getLabelText04(
                  "See Driver Detail",
                  color: AppColors.white.withOpacity(0.95),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
