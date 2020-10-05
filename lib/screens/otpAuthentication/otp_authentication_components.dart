
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';

class OTPAuthenticationComponents {



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


  Widget getRichText({@required String text, @required String clickableText, @required Function onTap}){
    return Container(
      child: Center(
        child: RichText(
          text: TextSpan(
              text: text,
              style: TextStyle(
                  color: Colors.black, fontSize: 12),
              children: <TextSpan>[
                TextSpan(text: clickableText,
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 12,
                        fontFamily: Assets.poppinsRegular
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => onTap(),
                )
              ]
          ),
        ),
      ),
    );
  }

}