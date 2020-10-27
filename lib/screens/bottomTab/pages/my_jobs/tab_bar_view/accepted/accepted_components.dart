

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class AcceptedComponents{
  Widget getJobContainer(
      {@required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String time,
        @required String status,
        @required String price,
        @required Function onClickPay}) {
    return Container(
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
            height: AppSizes.height * 0.01,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => onClickPay(),
                child: Container(
                  height: AppSizes.height*0.065,
                  width: AppSizes.width*0.38,
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(08,),
                  ),
                  alignment: Alignment.center,
                  child: TextView.getBottomButtonText04("Pay", color: Colors.white.withOpacity(0.8,)),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: AppSizes.height*0.065,
                width: AppSizes.width*0.38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(08,),
                  border: Border.all(color: AppColors.yellow,)
                ),
                alignment: Alignment.center,
                child: TextView.getBottomButtonText04("Cancel", color: AppColors.yellow.withOpacity(0.8,)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}