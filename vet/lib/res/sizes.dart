import 'dart:ui';
import 'package:flutter/material.dart';

class AppSizes {
  Size ?_screenSize;

  bool ?isPhone;
  double ?width;
  double ?height;

  double ?topPadding;

//For dynamic Sizing
  double ?widthRatio;
  double ?heightRatio;
  double ?fontRatio;

//Dynamic Font Sizes
  double ?extraSmallFontSize;
  double ?smallFontSize;
  double ?smallFontSizeA;
  double ?mediumFontSize;
  double ?regularFontSize;
  double ?largeFontSizeA;
  double ?largeFontSizeB;
  double ?largeFontSizeC;
  double ?extraLargeFontSize;
  double ?jumboFontSizeA;
  double ?jumboFontSizeB;

//padding
  double ?smallPadding;
  double ?regularPadding;
  double ?mediumPadding;
  double ?pagePadding;
  double ?largePadding;
  double ?extraLargePadding;
  double ?largerPadding;

//tablet specific padding
  double ?tabletInnerPadding;
  double ?tabletOuterPadding;
  double ?tabletPagePadding;
  double ?tabletLargeOuterMargin;
  double ?tabletExtraLargeOuterMargin;
  double ?tabletSocialMediaPadding;
  double ?tabletAuthCommentPadding;

  void initializeSize(context) {
    _screenSize = MediaQuery
        .of(context)
        .size;
    topPadding = MediaQuery
        .of(context)
        .padding
        .top;
    width = _screenSize?.shortestSide;
    height = _screenSize?.longestSide;
    isPhone = _screenSize!.shortestSide < 600;
    fontRatio =
    (isPhone! && _screenSize!.width <= 360) ? _screenSize!.width / 360 : 1.0;
    widthRatio = isPhone! ? _screenSize!.width / 360 : _screenSize!.width / 900;
    heightRatio =
    isPhone! ? _screenSize!.height / 720 : _screenSize!.height / 1200;
    extraSmallFontSize = 10.0 * fontRatio!;
    smallFontSize = 11.0 * fontRatio!;
    smallFontSizeA = 12.0 * fontRatio!;
    regularFontSize = 14.0 * fontRatio!;
    mediumFontSize = 16.0 * fontRatio!;
    largeFontSizeA = 18.0 * fontRatio!;
    largeFontSizeB = 20.0 * fontRatio!;
    largeFontSizeC = 22.0 * fontRatio!;
    extraLargeFontSize = 26.0 * fontRatio!;
    jumboFontSizeA = 30.0 * fontRatio!;
    jumboFontSizeB = 32.0 * fontRatio!;

    smallPadding = 4.0 * widthRatio!;
    regularPadding = 8.0 * widthRatio!;
    mediumPadding = 12.0 * widthRatio!;
    pagePadding = 16.0 * widthRatio!;
    largePadding = 24.0 * widthRatio!;
    extraLargePadding = 32.0 * widthRatio!;
    largerPadding = 32.0 * widthRatio!;

    tabletOuterPadding = 144.0 * widthRatio!;
    tabletInnerPadding = 76.0 * widthRatio!;
    tabletPagePadding = 48.0 * widthRatio!;
    tabletExtraLargeOuterMargin = 228.0 * widthRatio!;
    tabletLargeOuterMargin = 172.0 * widthRatio!;
    tabletSocialMediaPadding = 192.0 * widthRatio!;
    tabletAuthCommentPadding = 99.0 * widthRatio!;
  }

  void refreshSize(context) {
    _screenSize = MediaQuery
        .of(context)
        .size;
    width = _screenSize?.width;
    height = _screenSize?.height;
  }
}