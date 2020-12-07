
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class OTPAuthenticationComponents {



  Widget getOTPLableText({@required String text}){
    return Container(
      child: TextView.getLabelText04(text, color: AppColors.colorBlack.withOpacity(0.5),),
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