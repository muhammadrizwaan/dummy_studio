import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class ApplicationToast {
  static getErrorToast(
      {@required int durationTime,
      @required String heading,
      @required String subHeading}) async {
    await FlutterToastAlert.showToastAndAlert(
      toastDuration: durationTime,
      toastShowIcon: true,
      type: Type.Error,
      androidToast: subHeading,
      iosTitle: heading,
      iosSubtitle: subHeading,
    );
  }

  static getSuccessToast(
      {@required int durationTime,
      @required String heading,
      @required String subHeading}) async {
    await FlutterToastAlert.showToastAndAlert(
      toastDuration: durationTime,
      toastShowIcon: true,
      type: Type.Success,
      androidToast: subHeading,
      iosTitle: heading,
      iosSubtitle: subHeading,
    );
  }
  static getWarningToast({@required int durationTime, @required String heading, @required String subHeading}) async{
    await FlutterToastAlert.showToastAndAlert(
      toastDuration: durationTime,
      toastShowIcon: true,
      type: Type.Warning,
      androidToast: subHeading,
      iosTitle: heading,
      iosSubtitle: subHeading,
    );
  }

  static Widget onContactUsAlert(
      {
        @required BuildContext context,
        @required Function onPress,
      }) {
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: AppColors.blackTextColor.withOpacity(0.5),
          child: Center(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: AppSizes.width * 0.08,
                      right: AppSizes.width * 0.08),
                  height: AppSizes.height * 0.25,
                  width: AppSizes.width,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: AppSizes.width * 0.12,
                    right: AppSizes.width * 0.12,
                    top: AppSizes.width * 0.07,
                  ),
                  padding: EdgeInsets.only(
                    top: AppSizes.height * 0.08,
                  ),
                  height: AppSizes.height * 0.25,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: AppSizes.height * 0.01,
                          right: AppSizes.height * 0.01,
                        ),
                        child: TextView.getPopUpText(
                          'Notification has been sent to truckoom. They will contact soon',
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: AppSizes.height * 0.03,),

                      GestureDetector(
                          onTap: () => onPress(),
                          child: Container(
                            margin: EdgeInsets.only(left: AppSizes.width * 0.05,
                                right: AppSizes.width * 0.05),
                            width: AppSizes.width,
                            height: AppSizes.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.yellow,
                              ),
                              color: AppColors.yellow,
                            ),
                            child: Center(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: AppColors.white,
                                  fontFamily: Assets.poppinsLight,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: AppSizes.width * 0.42),
                  height: AppSizes.width * 0.15,
                  width: AppSizes.width * 0.15,
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    border:
                    Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Icon(
                    Entypo.air,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget onDescriptionAlert(
      {@required BuildContext context, @required String description}) {
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
                        TextView.getAlertDescriptionText(Strings.description,
                            color: AppColors.colorBlack.withOpacity(0.5)),
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
                              Container(
                                height: AppSizes.height * 0.026,
                                width: AppSizes.width * 0.06,
                                child: Image.asset(Assets.descriptionbookIcon,
                                ),
                              ),
                              SizedBox(width: AppSizes.width * 0.01),
                              Container(
                                width: AppSizes.width * 0.55,
                                child: TextView.getLabel2Text04(description,
                                    color: AppColors.colorBlack),
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
                          top: AppSizes.height * 0.015),
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
        });
  }

  static getLoginSignupToast({
    @required BuildContext context,
    @required String text,
    @required Function onNavigate,
  }) async {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.12,
                        right: AppSizes.width * 0.12,
                        top: AppSizes.width * 0.07,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.08,
                      ),
                      height: AppSizes.height * 0.2,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView.getPoppinsMediumF20L3BoldText(text,
                              color: AppColors.colorBlack),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => onNavigate(),
                            child: TextView.getContinueText04(
                              Strings.tapAndContinue,
                              color: AppColors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.425,
                      ),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  static onLoadAlert(
      {@required BuildContext context, @required Function onCancellLoad, @required String text}) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.1,
                        right: AppSizes.width * 0.1,
                        top: AppSizes.width * 0.08,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.08,
                        left: AppSizes.width * 0.08,
                        right: AppSizes.width * 0.08,
                      ),
                      height: AppSizes.height * 0.24,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView.getTabBarAlertText(
                              text,
                              color: AppColors.colorBlack,
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => onCancellLoad(),
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(
                                      04,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText(Strings.approve,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        04,
                                      ),
                                      border: Border.all(
                                        color: AppColors.yellow,
                                      )),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText(Strings.cancel,
                                      color: AppColors.yellow),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Entypo.air,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  static onPayConfirmationAlert(
      {@required BuildContext context, @required Function onCancellLoad, @required String text}) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.1,
                        right: AppSizes.width * 0.1,
                        top: AppSizes.width * 0.08,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.08,
                        left: AppSizes.width * 0.08,
                        right: AppSizes.width * 0.08,
                      ),
                      height: AppSizes.height * 0.2,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView.getTabBarAlertText(
                              text,
                              color: AppColors.colorBlack,
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => onCancellLoad(),
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(
                                      04,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText(Strings.approve,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        04,
                                      ),
                                      border: Border.all(
                                        color: AppColors.yellow,
                                      )),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText(Strings.cancel,
                                      color: AppColors.yellow),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                        Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.payment,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  static getLogOutPopup({
    @required BuildContext context,
    @required String onAcceptText,
    @required String onRejectText,
    @required Function onAccept,
    @required Function onReject,
    @required String headerText
  }) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.blackTextColor.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08),
                      height: AppSizes.height * 0.25,
                      width: AppSizes.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.width * 0.1,
                        right: AppSizes.width * 0.1,
                        top: AppSizes.width * 0.08,
                      ),
                      padding: EdgeInsets.only(
                        top: AppSizes.height * 0.05,
                        left: AppSizes.width * 0.05,
                        right: AppSizes.width * 0.05,
                      ),
                      height: AppSizes.height * 0.2,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView.getTabBarAlertText(
                              headerText,
                              color: AppColors.colorBlack,
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => onAccept(),
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.33,
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(03),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText(
                                      onAcceptText,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => onReject(),
                                child: Container(
                                  height: AppSizes.height * 0.05,
                                  width: AppSizes.width * 0.33,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        03,
                                      ),
                                      border: Border.all(
                                        color: AppColors.yellow,
                                      )),
                                  alignment: Alignment.center,
                                  child: TextView.getTabBarButtonText(
                                      onRejectText,
                                      color: AppColors.yellow),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.height * 0.01),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.425),
                      height: AppSizes.width * 0.15,
                      width: AppSizes.width * 0.15,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        border:
                        Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  static onReportIssue({
    @required BuildContext context,
    @required String heading,
    @required String lable,
    @required String placeHolder,
    @required Function onPress,
    @required TextEditingController reasonControler,
    @required Function onClose
  }) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
                color: AppColors.blackTextColor.withOpacity(0.5),
                child: Scaffold(
                  backgroundColor: AppColors.blackTextColor.withOpacity(0.5),
                  body: Center(
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: AppSizes.width * 0.12,
                              right: AppSizes.width * 0.12,
                              top: AppSizes.width * 0.07,
                            ),
                            padding: EdgeInsets.all(AppSizes.height * 0.02),
                            height: AppSizes.height * 0.41,
                            width: AppSizes.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                              Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: ListView(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: AppSizes.height * 0.02),
                                    TextView.getRatingPopUpHeaderText(heading, color: AppColors.colorBlack),
                                    SizedBox(height: AppSizes.height * 0.02),
                                    TextView.getLightText04(lable,
                                        color: AppColors.colorBlack,
                                        textAlign: TextAlign.center),
                                    SizedBox(height: AppSizes.height * 0.01),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppSizes.width * 0.02),
                                      height: AppSizes.height * 0.12,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border:
                                          Border.all(color: AppColors.borderColor)),
                                      child: TextField(
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: Assets.poppinsLight,
                                              fontSize: 12,
                                              color: AppColors.colorBlack),
                                          keyboardType: TextInputType.multiline,
                                          minLines: 1,
                                          //Normal textInputField will be displayed
                                          maxLines: 5,
                                          controller: reasonControler,
                                          // readOnly: true,
                                          decoration: InputDecoration(
                                            // prefixIcon: Image(image: AssetImage('$leftIcon')) ,
                                            hintText: placeHolder,
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 12,
                                              color: AppColors.colorBlack.withOpacity(0.6),
                                              fontFamily: Assets.poppinsLight,
                                            ),
                                          ),
                                          textAlignVertical: TextAlignVertical.top),
                                    ),
                                    SizedBox(height: AppSizes.height * 0.03),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CommonWidgets.getBottomButton(
                                          text: Strings.submit, onPress: () => onPress()),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => onClose(),
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: AppSizes.width * 0.81,
                                  top: AppSizes.height * 0.015),
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
                  ),
                )
            );
          },
        )
      },
    };
  }

}
