

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';

class BusinessSignupComponents {
  Widget getBusinessSignupStep(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Step ',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.grey,
          ),
        ),
        Text('1 of 2',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.yellow,
          ),
        ),
      ],
    );
  }

  Widget checkTermAndCondition({@required bool onCheck, @required Function onChanged, @required Function onTap }){
    return Container(
      child: Table(
        columnWidths: {0: FlexColumnWidth(0.15)},
        children: [
          TableRow(
              children: [
                Checkbox(
                  checkColor: AppColors.white,
                  activeColor: AppColors.yellow,
                  value: onCheck,
                  // onChanged: onChanged(),
                ),
                RichText(
                  text: TextSpan(
                      text: 'By creating an account you agree to our ',
                      style: TextStyle(
                          color: Colors.black, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(text: 'Term and Conditions',
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 12,
                                fontFamily: Assets.poppinsRegular
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap  = () => onTap(),
                        )
                      ]
                  ),
                )
              ]
          )
        ],

      ),
    );
  }

}