import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../res/assets.dart';

class CustomPopup {
  showLoader({
    BuildContext context,
    Function onPress,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: AppColors.blackTextColor.withOpacity(0.5),
          child: Center(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: AppSizes.width * 0.08,
                      right: AppSizes.width * 0.08),
                  height: AppSizes.height * 0.25,
                  width: AppSizes.width,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: AppSizes.width * 0.12,
                    right: AppSizes.width * 0.12,
                    top: AppSizes.width * 0.07,
                  ),
                  padding: EdgeInsets.only(
                    top: AppSizes.height * 0.08,
                  ),
                  height: AppSizes.height * 0.2,
                  width: AppSizes.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                    Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign up successful !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.colorBlack,
                            fontFamily: Assets.poppinsMedium,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => onPress(),
                        child: TextView.getContinueText04("Tap & Continue", color: AppColors.yellow,),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: AppSizes.width * 0.425,
                  ),
                  height: AppSizes.width * 0.15,
                  width: AppSizes.width * 0.15,
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    border:
                    Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
