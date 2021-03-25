

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class DriversCompnents{

  Widget getAssignTable() {
    return Container(
      width: AppSizes.width,
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: AppSizes.height * 0.04,
                child: Text(
                  'Drivers and Vehicles',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: Assets.poppinsRegular,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.width*0.02),
            ],
          ),
          Container(
            height: AppSizes.height * 0.05,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.height * 0.01),
            color: AppColors.lightGray,
            child: Row(
              children: [
                Container(
                  width: AppSizes.width * 0.1,
                  child: Text(
                    'sr#',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.black,),
                  ),
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                  width: AppSizes.width * 0.23,
                  child: Text(
                    'Driver',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                  width: AppSizes.width * 0.23,
                  child: Text(
                    'Vehicle',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                  width: AppSizes.width * 0.23,
                  child: Text(
                    'Status',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTableData({
    @required int sr,
    @required String driver,
    @required String vehicle,
    @required String status
  }){
    return Container(
      width: AppSizes.width,
      color: AppColors.white,

      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.height * 0.01),
            child: Row(
              children: [
                Container(
                    width: AppSizes.width * 0.1,
                    child: TextView.getDriverTableDataText((sr + 1).toString(), color: AppColors.WalletTableDataColor)
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                    width: AppSizes.width * 0.23,
                    child: TextView.getDriverTableDataText(driver, color: AppColors.WalletTableDataColor)
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                    width: AppSizes.width * 0.23,
                    child: TextView.getDriverTableDataText(vehicle, color: AppColors.WalletTableDataColor)
                ),
                SizedBox(width: AppSizes.width*0.02),
                Container(
                    width: AppSizes.width * 0.23,
                    child: TextView.getDriverTableDataText(status, color: AppColors.WalletTableDataColor)
                ),
                SizedBox(width: AppSizes.width*0.02),
              ],
            ),
          ),
          SizedBox(height: AppSizes.height * 0.005),
          Container(
            height: AppSizes.height * 0.002,
            color: AppColors.grey,
          ),
          SizedBox(height: AppSizes.height * 0.005)
        ],
      ),
    );

  }
}