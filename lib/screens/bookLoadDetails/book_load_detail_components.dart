
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class BookLoadDetailComponents {
  Widget getLocationContainer({@required String pickupLocation, @required String dropOffLocation}) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.height * 0.02, left: AppSizes.width * 0.04),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.0975,
                padding: EdgeInsets.only(top: AppSizes.height * 0.0045),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.colorBlack
                      ),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey
                      ),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey
                      ),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey
                      ),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey
                      ),
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.grey
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.yellow
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: AppSizes.width * 0.03),
              Container(
                // height: AppSizes.height * 0.14,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: AppSizes.height * 0.082,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pickup Location',
                            style: TextStyle(
                              fontFamily: Assets.poppinsRegular,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.002),
                          Text(
                            pickupLocation,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: Assets.poppinsLight,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: AppSizes.height * 0.01),
                    Container(
                      height: AppSizes.height * 0.082,
                      width: AppSizes.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.fromBorderSide()
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dropoff Location',
                            style: TextStyle(
                              fontFamily: Assets.poppinsRegular,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.002),
                          Text(
                            dropOffLocation,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: Assets.poppinsLight,
                              fontSize: 12,
                              color: AppColors.colorBlack,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget getExpectedRate({@required double rate}){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage(Assets.percentageIcon),
                fit: BoxFit.cover,
              )
          ),
          SizedBox(width: AppSizes.width * 0.03,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rate',
                  style: TextStyle(
                      fontFamily: Assets.poppinsRegular,
                      fontSize: 12,
                      color: AppColors.colorBlack
                  ),
                ),
                SizedBox(height: AppSizes.height * 0.001),
                Text('AED $rate',
                  style: TextStyle(
                      fontFamily: Assets.poppinsLight,
                      fontSize: 12,
                      color: AppColors.colorBlack
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget getLoadImages({@required String images}){
    return Container(
      height: AppSizes.height * 0.08,
      width: AppSizes.width * 0.008,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Image(image: AssetImage(images),
        fit: BoxFit.contain,
      ),
    );
  }
}