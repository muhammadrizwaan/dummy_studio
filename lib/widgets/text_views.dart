import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/res/colors.dart';

import '../res/assets.dart';
import '../res/sizes.dart';

class TextView {
  static Text getLightText04(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontFamily: Assets.poppinsLight,
        color: AppColors.colorBlack.withOpacity(0.7),
        //color: Color.fromRGBO(28, 40, 38, 1),
      ),
    );
  }
  static Text getPoppinsMediumF20L3BoldText(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 20,
        fontFamily: Assets.poppinsMedium,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text getLightText05(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: Assets.poppinsRegular,
        color: AppColors.colorBlack.withOpacity(0.7),
        //color: Color.fromRGBO(28, 40, 38, 1),
      ),
    );
  }
  static Text getLightTextLanguage(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontFamily: Assets.poppinsLight,
        //color: AppColors.colorBlack.withOpacity(0.7),
        color: Color.fromRGBO(28, 40, 38, 1),
      ),
    );
  }


  static Text getHeadingText04(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: Assets.poppinsMedium,
        color: color,
      ),
    );
  }

  static Text getLabelText04(final text, {@required final color,  final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        fontFamily: Assets.poppinsRegular,
        color: color,
      ),
    );
  }
  static Text getLocationTextField(final text, {@required final color,  final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        fontFamily: Assets.poppinsRegular,
        color: color,
      ),
    );
  }

  static Text getLabelHeadingText04(final text, {@required final color,  final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        fontFamily: Assets.poppinsRegular,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Text getBottomButtonText04(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        fontFamily: Assets.poppinsLight,
        color: color,
      ),
    );
  }

  static Text getContinueText04(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 12,
        fontFamily: Assets.poppinsRegular,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Text getRoundTripText04(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 14,
        fontFamily: Assets.poppinsMedium,
        // fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Text getLabel2Text04(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 12,
        fontFamily: Assets.poppinsLight,
        // fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Text getDescriptionText(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 12,
        fontFamily: Assets.poppinsLight,
        color: color,
      ),
    );
  }

  static Text getAppBarText(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: Assets.poppinsMedium,
        color: color,
      ),
    );
  }

  static Text getAlertDescriptionText(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 14,
        fontFamily: Assets.poppinsRegular,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  static Text getPopUpText(final text,
      {@required final color, final TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 14,
        fontFamily: Assets.poppinsLight,
        // fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
  static Text getTabBarAlertText(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 14,
        fontFamily: Assets.poppinsLight,
        // fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  static Text getTabBarButtonText(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 13,
        fontFamily: Assets.poppinsLight,
        // fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  static Text getRatingPopUpHeaderText(final text, {@required final color, final TextAlign textAlign = TextAlign.start}){
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 18,
        fontFamily: Assets.poppinsMedium,
        // fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}