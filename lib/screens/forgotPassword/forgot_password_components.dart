

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';

class ForgotPasswordComponent {
  Widget getOTPLableText({@required String text}){
    return Container(
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.colorBlack,
          fontSize: 14,
          fontFamily: Assets.poppinsLight,
        ),
      ),
    );
  }
}