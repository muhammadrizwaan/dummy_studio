import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../res/colors.dart';

class CommonWidgets {
  static Widget getBottomButton(
      {@required String text, @required Function onPress}) {
    return Container(
      width: AppSizes.width,
      height: AppSizes.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.yellow,
        ),
        color: AppColors.yellow,
      ),
      child: FlatButton(
        onPressed: () => onPress(),
        child: TextView.getBottomButtonText04(
          text,
          color: AppColors.white,
        ),
      ),
    );
  }

  static Widget onNullData({@required String text}){
    return Container(
      // margin: EdgeInsets.only(top: 10, bottom: 25),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: AppColors.profileTextColor,
            fontSize: 12,
            fontFamily: Assets.poppinsLight,
          ),
        ),
      ),
    );
  }

  static Widget applyCouponContainer({
    @required String text,
    @required Function onPress,
    @required Function onCouponPress,
  }) {
    return Container(
      margin: EdgeInsets.all(AppSizes.width * 0.05),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onCouponPress(),
            child: Container(
              height: AppSizes.height * 0.05,
              width: AppSizes.width * 0.1,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image(
                image: AssetImage(Assets.couponIcon),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: AppSizes.width * 0.02),
          Container(
            width: AppSizes.width * 0.76,
            height: AppSizes.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.yellow,
              ),
              color: AppColors.yellow,
            ),
            child: FlatButton(
              onPressed: () => onPress(),
              child: Text(
                text,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: AppColors.white,
                  fontFamily: Assets.poppinsLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget getAppBar(
      {@required String text,
      @required String iconName,
      @required String clickableText,
      @required Function onPress,
      @required Function onTap}) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => onPress(),
              child: Container(
                height: AppSizes.height*0.025,
                width: AppSizes.width*0.025,
                child: Image(
                  image: AssetImage('assets/png/$iconName'),
                  fit: BoxFit.cover,
                ),
              )),
          RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: Assets.poppinsRegular,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: clickableText,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                    fontFamily: Assets.poppinsRegular,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () => onTap(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static Widget getAppBarCross(
      {@required String text,
      @required String iconName,
      @required String clickableText,
      @required Function onPress,
      @required Function onTap}) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => onPress(),
              child: Container(
                height: AppSizes.height*0.035,
                width: AppSizes.width*0.035,
                child: Image(
                  image: AssetImage('assets/png/$iconName'),
                  fit: BoxFit.cover,
                ),
              )),
          RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: Assets.poppinsRegular,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: clickableText,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                    fontFamily: Assets.poppinsRegular,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () => onTap(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget tabsAppBar1(
      {@required String text,
      @required IconData iconName,
      @required Function onPress}) {
    return Container(
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      // color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: Assets.poppinsMedium,
              fontSize: 22,
              color: AppColors.colorBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => onPress(),
            child: Icon(
              iconName,
              size: 25,
              color: AppColors.colorBlack.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  static Widget tabsAppBar2(
      {@required String text, @required Function onPress}) {
    return Container(
      padding: EdgeInsets.only(
        left: AppSizes.width * 0.05,
        top: AppSizes.width * 0.05,
        bottom: AppSizes.width * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => onPress(),
            child: Container(
              height: AppSizes.height*0.04,
              width: AppSizes.width*0.04,
              child: Image.asset(
                'assets/png/back_arrow_otp.png'
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
              width: AppSizes.width * 0.85,
              child: TextView.getAppBarText(
                  text, color:
              AppColors.colorBlack
              )
          )
        ],
      ),
    );
  }

  static Widget getHeadingText({@required String text}) {
    return Container(
      child: TextView.getHeadingText04(
        text,
        color: AppColors.colorBlack,
      ),
    );
  }

  static Widget getSubHeadingText({@required String text}) {
    return Container(
      child: TextView.getLabelText04(
        text,
        color: AppColors.colorBlack.withOpacity(0.45),
      ),
    );
  }

  static Widget getTextField(
      {@required bool isPassword,
      @required IconData leftIcon,
      @required TextEditingController textEditingController,
      @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.07,
      width: AppSizes.width * 0.85,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
              opacity: 0.7,
              child: Icon(
                leftIcon,
                size: 20,
              )),
          Center(
            child: Container(
              // color: AppColors.yellow,
              padding: EdgeInsets.only(left: 5),
              width: AppSizes.width * 0.65,
              // height: AppSizes.height * 0.05,
              child: TextField(
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                ),
                controller: textEditingController,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: AppSizes.height * 0.035,
              width: AppSizes.width * 0.085,
              child: Image(
                  image: AssetImage(
                      'assets/png/check_circle_fill_pn.png'))),
        ],
      ),
    );
  }
  static Widget getTextField2({
    @required bool isPassword,
    @required IconData leftIcon,
    @required TextEditingController textEditingController,
    @required String hintText,
    @required bool filledField,
  }) {
    return Container(
      height: AppSizes.height * 0.07,
      width: AppSizes.width * 0.85,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
              opacity: 0.7,
              child: Icon(
                leftIcon,
                size: 20,
              )),
          Center(
            child: Container(
              // color: AppColors.yellow,
              width: AppSizes.width * 0.65,
              // height: AppSizes.height * 0.05,
              child: TextField(
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: Assets.poppinsLight,
                  fontSize: 12,
                  color: AppColors.colorBlack,
                ),
                controller: textEditingController,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 13,
                    fontFamily: Assets.poppinsLight,
                  ),
                ),
              ),
            ),
          ),
          filledField ?
          Image(image: AssetImage('assets/png/check_circle_fill_pn.png'))
              :
          Container(),
        ],
      ),
    );
  }


  static Widget getAlertDialouge(
      {@required BuildContext context,
      @required Widget child,
      @required String text}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Stack(children: [
                Container(
                  height: AppSizes.height * 0.18,
                  width: AppSizes.width * 0.7,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: child,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: AppSizes.height * 0.05,
                    width: AppSizes.width * 0.05,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.success),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ]),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Container(
                  margin: EdgeInsets.only(
                      right: AppSizes.width * 0.22,
                      bottom: AppSizes.height * 0.05),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Close and Continue",
                        style: TextStyle(color: AppColors.yellow, fontSize: 14),
                      )),
                ),
              ]);
        });
  }

  static Widget getAlertDialouge2(
      {@required BuildContext context,
      @required Widget child,
      @required String text}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: AppSizes.height * 0.02,
            width: AppSizes.width * 0.04,
            child: AlertDialog(
                content: Stack(children: [
                  Container(
                    height: AppSizes.height * 0.18,
                    width: AppSizes.width * 0.7,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: child,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: AppSizes.height * 0.05,
                      width: AppSizes.width * 0.05,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.success),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ]),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  Container(
                    margin: EdgeInsets.only(
                        right: AppSizes.width * 0.22,
                        bottom: AppSizes.height * 0.05),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Close and Continue",
                          style:
                              TextStyle(color: AppColors.yellow, fontSize: 14),
                        )),
                  ),
                ]),
          );
        });
  }

  static Widget getBankField(
      {@required bool isPassword,
      @required String leftIcon,
      @required TextEditingController textEditingController,
      @required String hintText}) {
    return Container(
      height: AppSizes.height * 0.06,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: Assets.poppinsLight,
            fontSize: 12,
            color: AppColors.colorBlack),
        controller: textEditingController,
        obscureText: isPassword,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: AppSizes.height* 0.007),
          prefixIcon: Icon(
            MdiIcons.dialpad,
            size: 20,
            color: AppColors.black,
          ),
          suffixIcon: Icon(
            Elusive.ok_circled2,
            size: 18,
            color: AppColors.yellow,
          ),
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
            fontFamily: Assets.poppinsLight,
          ),
        ),
      ),
    );
  }

  static Widget getWalletPriceBox({@required String walletPrice}) {
    return Container(
      width: AppSizes.width,
      height: AppSizes.height * 0.1,
      color: AppColors.lightGray,
      margin: EdgeInsets.symmetric(vertical: AppSizes.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'AED',
            style: TextStyle(
                fontSize: 15,
                fontFamily: Assets.poppinsRegular,
                color: AppColors.yellow,
                fontWeight: FontWeight.bold),
          ),
          Text(
            walletPrice,
            style: TextStyle(
              fontSize: 28,
              fontFamily: Assets.poppinsRegular,
              color: AppColors.colorBlack,
              // fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  static Widget getPayField(
      {@required bool isPassword,
      @required String leftIcon,
      @required TextEditingController textEditingController,
      @required String hintText}) {
    return Container(
        height: AppSizes.height * 0.07,
        width: AppSizes.width,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.02),
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(5),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(leftIcon),
              ),
              // Icon(
              //   Icons.radio_button_checked,
              //   color: AppColors.yellow,
              // ),
              SizedBox(
                width: AppSizes.width * 0.03,
              ),
              Text(
                hintText,
                style: TextStyle(
                  color: AppColors.colorBlack,
                  fontSize: 12,
                  fontFamily: Assets.poppinsRegular,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage(Assets.rightArrow),
              ),
              // Icon(
              //   Icons.arrow_forward_ios,
              //   color: AppColors.colorBlack,
              // )
            ],
          ),
        ]));
  }

  static Widget ProfileAppBar(
      { @required String heading,
        @required Function onTap,
        @required Function onBellTap
      }) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0,3)
            )
          ]
      ),
      padding: EdgeInsets.all(AppSizes.width * 0.05),
      margin: EdgeInsets.only(bottom: AppSizes.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => onTap(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  )),
              SizedBox(width: AppSizes.width * 0.02),
              TextView.getAppBarText(heading, color: AppColors.colorBlack)
            ],
          ),
          GestureDetector(
              onTap: () => onBellTap(),
              child: Icon(
                FontAwesome5.edit,
                size: 20,
              ))
        ],
      ),
    );
  }
  /*static Widget AlertBoxSuzuki(
    {@required BuildContext context,}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
            color: AppColors.blackTextColor.withOpacity(0.5),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: AppSizes.width * 0.12,
                      right: AppSizes.width * 0.12,
                      top: AppSizes.width * 0.07,
                    ),
                    padding: EdgeInsets.all(AppSizes.height * 0.02),
                    height: AppSizes.height * 0.23,
                    width: AppSizes.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                      Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: AppSizes.height* 0.02),
                        TextView.getAlertDescriptionText(
                            Strings.description,
                            color: AppColors.colorBlack.withOpacity(0.5)
                        ),
                        SizedBox(width: AppSizes.width * 0.05),
                        Container(
                          height: AppSizes.height * 0.15,
                          padding: EdgeInsets.all(AppSizes.height * 0.01),
                          margin: EdgeInsets.only(top: AppSizes.height * 0.005),
                          decoration: BoxDecoration(
                            color: AppColors.alertContainer,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Opacity(
                                opacity: 0.6,
                                child: Icon(
                                  Icons.message,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: AppSizes.width * 0.01),
                              Container(
                                width: AppSizes.width * 0.55,
                                child: TextView.getLabel2Text04(
                                    "Vivamus eget aliquam dui. Integer eu arcu vel arcu suscipit ultrices quis non mauris. Aenean scelerisque, sem eu dictum commodo,ligula",
                                    color: AppColors.colorBlack
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.81,
                          top: AppSizes.height * 0.015
                      ),
                      height: AppSizes.width * 0.1,
                      width: AppSizes.width * 0.1,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.yellow),
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: Icon(
                        Icons.clear,
                        color: AppColors.yellow,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }*/

}
