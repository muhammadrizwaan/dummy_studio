

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/referrals/referrals_components.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

class Referrals extends StatefulWidget {
  @override
  _ReferralsState createState() => _ReferralsState();
}

class _ReferralsState extends State<Referrals> {
  ReferralsComponents _referralsComponents;

  @override
  void initState() {
    super.initState();
    _referralsComponents = ReferralsComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.white,
            child: Column(
              children: [
                CommonWidgets.tabsAppBar2(
                    text: "Referrals",
                    onPress: (){
                      Navigator.pop(context);
                    }
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppSizes.height * 0.03,),
                              CommonWidgets.getSubHeadingText(text: "Referrals Link"),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _referralsComponents.getLinkField(
                                  leftIcon: Assets.linkIcon,
                                  hintText: "https://play.google.com/store/apps/details..."
                              ),
                              SizedBox(height: AppSizes.height * 0.03,),
                              CommonWidgets.getBottomButton(
                                  text: "Share Link",
                                  onPress: (){}
                              ),
                            ]
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
        )
      ),
    );
  }
}
