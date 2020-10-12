import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                    text: "Payment Method",
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
                            CommonWidgets.getLableText(text: "Payment Method"),
                            SizedBox(
                              height: 10,
                            ),
                            CommonWidgets.getPayField(
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
                            CommonWidgets.getPayField(
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
                            CommonWidgets.getPayField(
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
                            CommonWidgets.getPayField(
                                isPassword: false,
                                leftIcon: 'icon_card_number.png',
                                // textEditingController: email,
                                hintText: "01/2020"),
                            SizedBox(
                              height: 30,
                            ),
                            CommonWidgets.getBottomButton(
                                text: "SIGNUP",
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

                          Container(
                            height: AppSizes.height * 0.06,
                            width: AppSizes.width,
                            margin: EdgeInsets.only(left:AppSizes.width*0.05,right:AppSizes.width*0.05,bottom: AppSizes.height*0.01),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              border: Border.all(color: AppColors.lightGray),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Promo Code",
                                hintStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontFamily: Assets.poppinsLight,
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              hideLoader(context);
                            },
                            child: Container(

                              margin: EdgeInsets.only(left:AppSizes.width*0.05,right:AppSizes.width*0.05),
                              width: AppSizes.width,
                              height: AppSizes.height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.yellow,
                                ),
                                color: AppColors.yellow,
                              ),
                              child: Center(
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    color: AppColors.white,
                                    fontFamily: Assets.poppinsLight,
                                  ),
                                ),
                              ),
                            )
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
                        FontAwesomeIcons.ticketAlt,
                        color: Colors.white,
                        size: 30,
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
