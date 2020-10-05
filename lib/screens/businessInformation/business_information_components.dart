
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';

class BusinessInformationComponents {
  Widget getBusinessSignupStep(){
    return Row(
      children: [
        Text('Step ',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.grey,
          ),
        ),
        Text('02',
          style: TextStyle(
            fontSize: 15,
            fontFamily: Assets.poppinsRegular,
            color: AppColors.yellow,
          ),
        ),
      ],
    );
  }
}