import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/models/api_models/login_response.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/screens/individualPayment/individual_payment.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/payment/payment.dart';

import '../../../../animations/slide_right.dart';
import '../../../../res/assets.dart';

import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../res/strings.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../wallet/wallet.dart';

class MyJobs extends StatefulWidget {
  String tag;

  MyJobs({@required this.tag});

  @override
  _MyJobsState createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  MyJobsComponents _jobsComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobsComponents = MyJobsComponents();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets.tabsAppBar1(
                text: "My Jobs",
                iconName: widget.tag == Strings.indiviual
                    ? Assets.bellIconUnpress
                    : Assets.walletIcon,
                onPress: () {
                  widget.tag == Strings.indiviual
                      ? Navigator.push(
                          context, SlideRightRoute(page: Notifications()))
                      : Navigator.push(
                          context, SlideRightRoute(page: Wallet()));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.03,
              ),
              _jobsComponents.getSelectViewText(),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.redAccent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.yellow,
                ),
                tabs: [
                  Container(
                    width: AppSizes.width * 0.25,
                    height: AppSizes.height*0.06,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Tab(
                      child: Text("Placed"),
                    ),
                  ),
                  Container(
                    width: AppSizes.width * 0.25,
                    height: AppSizes.height*0.06,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Tab(
                      child: Text("Accepted"),
                    ),
                  ),
                  Container(
                    width: AppSizes.width * 0.25,
                    height: AppSizes.height*0.06,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Tab(
                      child: Text("In Process"),
                    ),
                  ),
                  Container(
                    width: AppSizes.width * 0.25,
                    height: AppSizes.height*0.06,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.yellow,
                      ),
                      borderRadius: BorderRadius.circular(08),
                    ),
                    child: Tab(
                      child: Text("Dispatched"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Placed(),
                    Accepted(),
                    Container(
                      color: Colors.teal,
                    ),
                    Container(
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
//            Expanded(
//              child: ListView(
//                children: [
//                  Container(
//                    margin:
//                        EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
//                    child: Column(
//                      children: [
//                        SizedBox(
//                          height: AppSizes.height * 0.02,
//                        ),
//                        _jobsComponents.getJobContainer(
//                            jobDetail: "01",
//                            pickUpLocation: "ABC Port:",
//                            destinationLocation: "227 Building, UAE:",
//                            startDate: "11 Aug,",
//                            time: '12:00am',
//                            status: "Active",
//                            price: "AED 260",
//                            onTap: () {}),
//                        SizedBox(
//                          height: AppSizes.height * 0.02,
//                        ),
//                        _jobsComponents.getJobContainer(
//                            jobDetail: "01",
//                            pickUpLocation: "ABC Port:",
//                            destinationLocation: "227 Building, UAE:",
//                            startDate: "11 Aug,",
//                            time: '12:00am',
//                            status: "Active",
//                            price: "AED 260",
//                            onTap: () {}),
//                        SizedBox(
//                          height: AppSizes.height * 0.02,
//                        ),
//                        _jobsComponents.getJobContainer(
//                            jobDetail: "01",
//                            pickUpLocation: "ABC Port:",
//                            destinationLocation: "227 Building, UAE:",
//                            startDate: "11 Aug,",
//                            time: '12:00am',
//                            status: "Active",
//                            price: "AED 260",
//                            onTap: () {}),
//                        SizedBox(
//                          height: AppSizes.height * 0.02,
//                        ),
//                        _jobsComponents.getJobContainer(
//                            jobDetail: "01",
//                            pickUpLocation: "ABC Port:",
//                            destinationLocation: "227 Building, UAE:",
//                            startDate: "11 Aug,",
//                            time: '12:00am',
//                            status: "Active",
//                            price: "AED 260",
//                            onTap: () {}),
//                        SizedBox(
//                          height: AppSizes.height * 0.02,
//                        ),
//                      ],
//                    ),
//                  )
//                ],
//              ),
//            ),
            ],
          )),
    );
  }
}
