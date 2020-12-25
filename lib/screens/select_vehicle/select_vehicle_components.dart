import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/sizes.dart';

class SelectVechileComponents {
  Widget getTextField(
      {@required String leftIcon,
      @required TextEditingController textEditingController,
      @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.05,
      width: AppSizes.width,
      padding: EdgeInsets.only(left: 10),
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
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.search, size: 20, color: AppColors.colorBlack.withOpacity(0.6),),
          Center(
            child: Container(
              // color: AppColors.yellow,
              height: AppSizes.height * 0.05,
              width: AppSizes.width * 0.8,
              padding: EdgeInsets.only(top: 15),
              child: TextField(
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: Assets.poppinsLight,
                    fontSize: 12,
                    color: AppColors.colorBlack),
                controller: textEditingController,
                decoration: InputDecoration(
                  // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getVehicleDetail({
    @required String leftIcon,
    @required String vehicleType,
    @required String vehicleDetail,
    @required bool isSelect,
    @required String Category,
    @required Function onAlert,
    @required Function onLoadDetail,
  }) {
    return GestureDetector(
      onTap: () => onLoadDetail(),
      child: Container(
        // height: AppSizes.height * 0.05,
        margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
        padding: EdgeInsets.all(AppSizes.width * 0.03),
        width: AppSizes.width,
        decoration: BoxDecoration(
            color: isSelect ? AppColors.lightGray : Colors.white,
            // border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[500].withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: AppSizes.height * 0.07,
                    width: AppSizes.width * 0.16,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Image(image: leftIcon != ""? NetworkImage(leftIcon): AssetImage(Assets.vehicle_img),
                    fit: BoxFit.fill,
                    ),
                ),
                SizedBox(
                  width: AppSizes.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$vehicleType',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: Assets.poppinsMedium,
                          color: AppColors.colorBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                    Text(
                      'Vehicle Type: $vehicleDetail',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: Assets.poppinsRegular,
                        color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Vehicle Type: $vehicleDetail | ',
                    //       style: TextStyle(
                    //         fontSize: 11,
                    //         fontFamily: Assets.poppinsRegular,
                    //         color: AppColors.colorBlack,
                    //         // fontWeight: FontWeight.bold
                    //       ),
                    //     ),
                    //     Text(
                    //       'Category: $Category',
                    //       style: TextStyle(
                    //         fontSize: 11,
                    //         fontFamily: Assets.poppinsRegular,
                    //         color: AppColors.colorBlack,
                    //         // fontWeight: FontWeight.bold
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () => onAlert(),
              child: Icon(Octicons.info, size: 20, color: AppColors.colorBlack.withOpacity(0.70),),
            ),
          ],
        ),
      ),
    );
  }
}
