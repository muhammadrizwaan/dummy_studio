import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_components.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
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
                status: "Placed",
                price: "AED 260",
                onAlert: () {
                  ApplicationToast.AlertBoxSuzuki(context: context);

                },
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: JobDetails(tag: 'Placed')));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                jobDetail: "02",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Placed",
                price: "AED 260",
                onAlert: () {
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: JobDetails(tag: 'Placed')));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                  jobDetail: "03",
                  pickUpLocation: "ABC Port:",
                  destinationLocation: "227 Building, UAE:",
                  startDate: "11 Aug,",
                  time: '12:00am',
                  status: "Placed",
                  price: "AED 260",
                  onAlert: () {
                    ApplicationToast.AlertBoxSuzuki(context: context);
                  },
                  onTap: () {
                    Navigator.push(context, SlideRightRoute(page: JobDetails(tag: 'Placed')));
                  }),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                jobDetail: "04",
                pickUpLocation: "ABC Port:",
                destinationLocation: "227 Building, UAE:",
                startDate: "11 Aug,",
                time: '12:00am',
                status: "Placed",
                price: "AED 260",
                onAlert: () {
                  ApplicationToast.AlertBoxSuzuki(context: context);
                },
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: JobDetails(tag: 'Placed')));
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


}
