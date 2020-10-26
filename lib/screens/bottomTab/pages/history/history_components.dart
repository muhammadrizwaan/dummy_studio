

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';

class HistoryComponents{
  Widget getTransectionsContainer({
    @required String jobDetail,
    @required String pickUpLocation,
    @required String destinationLocation,
    @required String startDate,
    @required String endDate,
    @required String price,
    @required String status,
    @required Function onInvoice,
    @required Function onTap,
  }) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      startDate,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                    Text(
                      endDate,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
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
          ),
          SizedBox(
            height: AppSizes.height * 0.02,
          ),
          Container(
            width: AppSizes.width,
            height: AppSizes.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.yellow,
              ),
              color: AppColors.yellow,
            ),
            child: FlatButton(
              onPressed: () => onInvoice(),
              child: Text(
                'view Invoice',
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
    );
  }
}