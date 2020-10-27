import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
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
                Divider(height: 10),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: AppSizes.width * 0.08,
                          right: AppSizes.width * 0.08,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: AppSizes.height * 0.04),
                            CommonWidgets.getSubHeadingText(
                                text: "Account Holder Name"),
                            SizedBox(height: AppSizes.height * 0.01),
                            CommonWidgets.getTextField(
                                isPassword: false,
                                leftIcon: Entypo.user,
                                // textEditingController: name,
                                hintText: "Enter Account Holder Name"
                            ),
                            SizedBox(height: AppSizes.height * 0.02),
                            CommonWidgets.getSubHeadingText(text: "Card Number"),
                            SizedBox(height: AppSizes.height * 0.01),
                            CommonWidgets.getTextField(
                                isPassword: false,
                                leftIcon: MdiIcons.dialpad,
                                // textEditingController: name,
                                hintText: "Enter Card Number"
                            ),
                            SizedBox(height: AppSizes.height * 0.02),
                            CommonWidgets.getSubHeadingText(text: "CVC Code"),
                            SizedBox(height: AppSizes.height * 0.01),
                            CommonWidgets.getTextField(
                                isPassword: false,
                                leftIcon: MdiIcons.dialpad,
                                // textEditingController: name,
                                hintText: "Enter CVC Code"
                            ),
                            SizedBox(height: AppSizes.height * 0.02),
                            CommonWidgets.getSubHeadingText(text: "Expiry Date"),
                            SizedBox(height: AppSizes.height * 0.01),
                            CommonWidgets.getTextField(
                                isPassword: false,
                                leftIcon: MdiIcons.dialpad,
                                // textEditingController: name,
                                hintText: "Enter Expiry Date"
                            ),
                            SizedBox(height: AppSizes.height * 0.04),
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
                        Text(
                        "Payment Successful!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.colorBlack,
                            fontFamily: Assets.poppinsMedium,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          hideLoader(context);
                          Navigator.pushNamedAndRemoveUntil(context, Routes.bottomTab, (r) => false);
                          // hideLoader(context);
                        },
                        child: Text(
                          "Tap & Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: AppColors.yellow,
                              fontFamily: Assets.poppinsRegular,
                              fontWeight: FontWeight.bold),
                        // ),
                      ),
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
            ),)
            ,
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
