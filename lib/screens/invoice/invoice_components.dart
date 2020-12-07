

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class InvoiceComponents{
  Widget getInvoiceContainer(
      {
        @required String jobDetail,
        @required String pickUpLocation,
        @required String destinationLocation,
        @required String startDate,
        @required String endDate,
        @required String price,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(jobDetail,
                style: TextStyle(
                    fontSize:12,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.colorBlack,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(price,
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
        ],
      ),
    );
  }
}