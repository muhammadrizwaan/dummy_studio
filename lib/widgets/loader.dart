import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
            child: Container(
              height: AppSizes.height *0.35,
              width: AppSizes.width *0.35,
              child: Lottie.asset("assets/json/smooth-e-commerce-icon.json",),
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
