

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class HistoryComponents{
  Widget getHistoryContainer(
      {
        @required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String endDate,
        @required String rating,
        @required String status,
        @required Function onTap
      })
  {
    return Container(
      // height: AppSizes.height * 0.05,
      // width: AppSizes.width,
      padding: EdgeInsets.all(AppSizes.width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('001',
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(' : ',
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(jobDetail,
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage(Assets.df_pk_job),
                      height: 40,
                      width: 20,
                    ),
                    SizedBox(width: AppSizes.width * 0.01,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pickUpLocation,
                          style: TextStyle(
                            fontSize:12,
                            fontFamily: Assets.poppinsRegular,
                            color: AppColors.locationText,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: AppSizes.height * 0.01,),
                        Text(destinationLocation,
                          style: TextStyle(
                            fontSize:12,
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
                    Text(startDate,
                      style: TextStyle(
                        fontSize:12,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: AppSizes.height * 0.01,),
                    Text(endDate,
                      style: TextStyle(
                        fontSize:12,
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
          SizedBox(height: AppSizes.height * 0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rating',
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.status,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(rating,
                style: TextStyle(
                  fontSize:11,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.status,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status',
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.status,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(status,
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Vehicle Type:',
                style: TextStyle(
                  fontSize:12,
                  fontFamily: Assets.poppinsRegular,
                  color: AppColors.status,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text('Suzuki',
                    style: TextStyle(
                        fontSize:12,
                        fontFamily: Assets.poppinsMedium,
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: AppSizes.width * 0.01,),
                  GestureDetector(
                    onTap: () => onTap(),
                    child: Image(image: AssetImage(Assets.informationIcon),
                      color: AppColors.colorBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}