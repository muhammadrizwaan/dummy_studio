

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';

import 'history_components.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HistoryComponents _historyComponents;

  @override
  void initState() {
    super.initState();
    _historyComponents  = HistoryComponents();
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
                    text: "History",
                    iconName: Assets.backArrow,
                    onPress: (){
                      Navigator.pop(context);
                    }
                ),
                Divider(height: 10,),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
                        child: Column(
                            children: [
                              SizedBox(height: AppSizes.height * 0.02,),
                              _historyComponents.getHistoryContainer(
                                jobDetail: "1100 KG Container - Port Pickup",
                                pickUpLocation: "ABC Port:",
                                destinationLocation: "227 Building, UAE:",
                                startDate: "11 Aug, 12:00am",
                                endDate: "12 Aug, 11:00pm",
                                rating: "Not rated",
                                status: "Completed",
                                onTap: (){}
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _historyComponents.getHistoryContainer(
                                  jobDetail: "1100 KG Container - Port Pickup",
                                  pickUpLocation: "ABC Port:",
                                  destinationLocation: "227 Building, UAE:",
                                  startDate: "11 Aug, 12:00am",
                                  endDate: "12 Aug, 11:00pm",
                                  rating: "Not rated",
                                  status: "Completed",
                                  onTap: (){}
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _historyComponents.getHistoryContainer(
                                  jobDetail: "1100 KG Container - Port Pickup",
                                  pickUpLocation: "ABC Port:",
                                  destinationLocation: "227 Building, UAE:",
                                  startDate: "11 Aug, 12:00am",
                                  endDate: "12 Aug, 11:00pm",
                                  rating: "Not rated",
                                  status: "Completed",
                                  onTap: (){}
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _historyComponents.getHistoryContainer(
                                  jobDetail: "1100 KG Container - Port Pickup",
                                  pickUpLocation: "ABC Port:",
                                  destinationLocation: "227 Building, UAE:",
                                  startDate: "11 Aug, 12:00am",
                                  endDate: "12 Aug, 11:00pm",
                                  rating: "Not rated",
                                  status: "Completed",
                                  onTap: (){}
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _historyComponents.getHistoryContainer(
                                  jobDetail: "1100 KG Container - Port Pickup",
                                  pickUpLocation: "ABC Port:",
                                  destinationLocation: "227 Building, UAE:",
                                  startDate: "11 Aug, 12:00am",
                                  endDate: "12 Aug, 11:00pm",
                                  rating: "Not rated",
                                  status: "Completed",
                                  onTap: (){}
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
                              _historyComponents.getHistoryContainer(
                                  jobDetail: "1100 KG Container - Port Pickup",
                                  pickUpLocation: "ABC Port:",
                                  destinationLocation: "227 Building, UAE:",
                                  startDate: "11 Aug, 12:00am",
                                  endDate: "12 Aug, 11:00pm",
                                  rating: "Not rated",
                                  status: "Completed",
                                  onTap: (){}
                              ),
                              SizedBox(height: AppSizes.height * 0.01,),
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
