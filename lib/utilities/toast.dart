import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
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

  static getLoginSignupToast({
    @required BuildContext context,
    @required String text,
    @required Function onNavigate,
  }) async {return {
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
                        TextView.getPoppinsMediumF20L3BoldText(text, color: AppColors.colorBlack),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => onNavigate(),
                            // Navigator.of(context).pushAndRemoveUntil(
                            //     SlideRightRoute(
                            //         page: BottomTab(tag: widget.tag)),
                            //         (Route<dynamic> route) => false);
                          // },
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
}
