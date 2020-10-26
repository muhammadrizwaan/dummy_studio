import 'package:flutter/cupertino.dart';

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
        fontFamily: Assets.poppinsMedium,
        color: color,
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
        fontSize: 20,
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
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        fontFamily: Assets.poppinsRegular,
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

}