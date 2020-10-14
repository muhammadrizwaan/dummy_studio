import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Bank extends StatefulWidget {
  @override
  _BankState createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.tabsAppBar2(
                    text: "Bank Transfer",
                    iconName: Assets.backArrow,
                    onPress: () {
                      Navigator.pop(context);
                    }),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(AppSizes.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            CommonWidgets.getLableText(
                                text: "Account Holder Name"),
                            SizedBox(
                              height: 10,
                            ),
                            CommonWidgets.getBankField(
                                isPassword: false,
                                leftIcon: 'name_icon.png',
                                // textEditingController: email,
                                hintText: "Mathew due"),
                            SizedBox(
                              height: 30,
                            ),
                            CommonWidgets.getLableText(text: "Card Number"),
                            SizedBox(
                              height: 10,
                            ),
                            CommonWidgets.getBankField(
                                isPassword: false,
                                leftIcon: 'icon_card_number.png',
                                // textEditingController: email,
                                hintText: "0123-0123-0123"),
                            SizedBox(
                              height: 30,
                            ),
                            CommonWidgets.getLableText(text: "CVC Code"),
                            SizedBox(
                              height: 10,
                            ),
                            CommonWidgets.getBankField(
                                isPassword: false,
                                leftIcon: 'icon_card_number.png',
                                // textEditingController: email,
                                hintText: "012"),
                            SizedBox(
                              height: 30,
                            ),
                            CommonWidgets.getLableText(text: "Expiry Date"),
                            SizedBox(
                              height: 30,
                            ),
                            CommonWidgets.getBankField(
                                isPassword: false,
                                leftIcon: 'icon_card_number.png',
                                // textEditingController: email,
                                hintText: "01/2020"),
                            SizedBox(
                              height: 30,
                            ),
                            CommonWidgets.getBottomButton(
                                text: "ADD",
                                onPress: () {
                                  _alertDialogueContainer();
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
  _alertDialogueContainer() {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your Payment is successfully",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "done",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              hideLoader(context);
                            },
                            child: Text(
                              "Click & Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: AppColors.yellow,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: AppSizes.width * 0.45),
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

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
