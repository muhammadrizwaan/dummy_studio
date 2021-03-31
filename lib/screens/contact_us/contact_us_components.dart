import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class ContactUsComponents {
  Widget getNameTextField({
    @required String image,
    @required String hintText,
    @required TextEditingController textEditingController,
  }) {
    return Container(
      height: AppSizes.height * 0.06,
      width: AppSizes.width,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        // border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            height: AppSizes.height * 0.06,
            width: AppSizes.width * 0.06,
            child: Image.asset(
              image,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            width: AppSizes.width * 0.6,
            child: TextField(
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack),
              controller: textEditingController,
              // readOnly: true,
              decoration: InputDecoration(
                // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                  fontFamily: Assets.poppinsLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getMessageTextField({
    @required String image,
    @required String hintText,
    @required TextEditingController textEditingController,
  }) {
    return Container(
      height: AppSizes.height * 0.12,
      width: AppSizes.width,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        // border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 6),
            child: Container(
              height: AppSizes.height * 0.06,
              width: AppSizes.width * 0.06,
              child: Image.asset(
                image,
              ),
            ),
          ),
          SizedBox(
            width: AppSizes.width * 0.02,
          ),
          Container(
            width: AppSizes.width * 0.7,
            child: TextField(
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: Assets.poppinsLight,
                    fontSize: 12,
                    color: AppColors.colorBlack),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                //Normal textInputField will be displayed
                maxLines: 5,
                controller: textEditingController,
                // readOnly: true,
                decoration: InputDecoration(
                  // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    color: AppColors.colorBlack,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
                textAlignVertical: TextAlignVertical.top),
          ),
        ],
      ),
    );
  }
}
