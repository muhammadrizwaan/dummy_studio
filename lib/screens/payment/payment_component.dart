

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class PaymentComponents{
  Widget getTotalContainer({
    @required BuildContext context,
    @required String jobName,
    @required String total,
    @required String couponDiscount,
    @required String vatAmount,
    @required String shipperCost
  }) {
    return Container(
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.03),
      // height: AppSizes.height*0.2,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Job ID',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                jobName,
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cost',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    shipperCost,
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Coupon Discount',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    couponDiscount,
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vat Amount',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.yellow,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    vatAmount,
                    style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.colorBlack,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: AppSizes.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price:',
                style: TextStyle(
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  Text(
                    'AED ',
                    style: TextStyle(
                        fontFamily: Assets.poppinsMedium,
                        fontSize: 12,
                        color: AppColors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    total,
                    style: TextStyle(
                        fontFamily: Assets.poppinsMedium,
                        fontSize: 12,
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}