

import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';

class MapComponents{
  Widget getLocationsList(){
    return Container();
  }

  Widget getLocationPickupText({@required String text}) {
    return Container(
      // margin: EdgeInsets.only(left: AppSizes.width * 0.03),
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.colorBlack,
          fontSize: 14,
          fontFamily: Assets.poppinsMedium,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}