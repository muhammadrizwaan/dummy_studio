import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';

import '../../res/colors.dart';

class LoginComponents {
  Widget getBottomRichText(
      {@required String text,
      @required String clickableText,
      @required Function onTap}) {
    return RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(
            color: AppColors.colorBlack.withOpacity(0.6),
            fontSize: 12,
          ),
          children: <TextSpan>[
            TextSpan(
              text: clickableText,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 12,
                fontFamily: Assets.poppinsSemiBold,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => onTap(),
            )
          ]),
    );
  }
}
