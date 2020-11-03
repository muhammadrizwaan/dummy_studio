import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/widgets/text_views.dart';

import '../../../../bottom_tab.dart';

class Placed extends StatefulWidget {
  @override
  _PlacedState createState() => _PlacedState();
}

class _PlacedState extends State<Placed> {
  PlacedComponents _placedComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placedComponents = PlacedComponents();
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
              _placedComponents.getJobContainer(
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Active",
                price: "AED 260",
                onAlert: () {
                  _onDescriptionAlert();
                },
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Active",
                price: "AED 260",
                onAlert: () {},
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: JobDetails()));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                  jobDetail: "01",
                  pickUpLocation: "ABC Port:",
                  destinationLocation: "227 Building, UAE:",
                  startDate: "11 Aug,",
                  time: '12:00am',
                  status: "Active",
                  price: "AED 260",
                  onTap: () {}),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                jobDetail: "01",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Active",
                price: "AED 260",
                onTap: () {
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
                      // padding: Edg,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.height* 0.02),
                          TextView.getLabelHeadingText04(
                              Strings.description,
                              color: AppColors.colorBlack
                          )
                        ],
                      ),
                    ),
                    Container(
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
