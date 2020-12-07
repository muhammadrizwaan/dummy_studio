import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

class Dispatch extends StatefulWidget {
  @override
  _DispatchState createState() => _DispatchState();
}

class _DispatchState extends State<Dispatch> {
  DispatchComponents _dispatchComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dispatchComponents = DispatchComponents();
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
              _dispatchComponents.getJobContainer(
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Delivered",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },

              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _dispatchComponents.getJobContainer(
                jobDetail: "02",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Delivered",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },

              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _dispatchComponents.getJobContainer(
                jobDetail: "03",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Delivered",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },

              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _dispatchComponents.getJobContainer(
                jobDetail: "04",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Delivered",
                price: "AED 260",
                onAlert: (){
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: (){
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },

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

  _onDescriptionAlert(){
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
                              color: AppColors.colorBlack
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
                      onTap: (){
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
          },
        )
      },
    };
  }
}