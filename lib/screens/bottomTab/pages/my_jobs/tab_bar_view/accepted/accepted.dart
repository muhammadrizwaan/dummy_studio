import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class Accepted extends StatefulWidget {
  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  AcceptedComponents _acceptedComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _acceptedComponents = AcceptedComponents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _acceptedComponents.getJobContainer(
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Accepted",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {
                  Navigator.push(context, SlideRightRoute(page: Payment()));
                },
                  onClickCancel: () {
                  _alertCancelContainer();
                }
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _acceptedComponents.getJobContainer(
                jobDetail: "02",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Accepted",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {
                  Navigator.push(context, SlideRightRoute(page: Payment()));
                },
                  onClickCancel: () {
                    _alertCancelContainer();
                  }
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _acceptedComponents.getJobContainer(
                jobDetail: "03",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Accepted",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {
                  Navigator.push(context, SlideRightRoute(page: Payment()));
                },
                  onClickCancel: () {
                    _alertCancelContainer();
                  }
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _acceptedComponents.getJobContainer(
                jobDetail: "04",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Accepted",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
                onClickPay: () {
                  Navigator.push(context, SlideRightRoute(page: Payment()));
                },
                  onClickCancel: () {
                    _alertCancelContainer();
                  }
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _alertCancelContainer() {
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
                              "Are you sure you want to cancel the Load?",
                              color: AppColors.colorBlack,
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  //Navigator.push(context, SlideRightRoute(page: MyLoads(selectedPage: 1)));
                                  //Navigator.push(context, MaterialPageRoute(builder:(context) => MyLoads(2)));
                                },
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
                                  child: TextView.getTabBarButtonText("Yes",
                                      color: Colors.white),
                                ),
                              ),
                              // SizedBox(
                              //   width: 20,
                              // ),
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
                                  child: TextView.getTabBarButtonText("No",
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
}
