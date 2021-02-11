import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/cancelled/cancelled.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/my_jobs_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import '../../../../animations/slide_right.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';

class MyJobs extends StatefulWidget {

  @override
  _MyJobsState createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  MyJobsComponents _jobsComponents;
  MyJobsProvider _myJobsProvider;
  int count;

  @override
  void initState() {
    super.initState();
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    _myJobsProvider.init(context: context);
    count = 0;
    _jobsComponents = MyJobsComponents();
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<MyJobsProvider>(context, listen: true);
    return DefaultTabController(
      length: 5,
      child: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.white,
          child: _myJobsProvider.isDataFetched?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets.tabsAppBar1(
                text: "My Jobs",
                iconName: FontAwesome5.bell,
                onPress: () {
                  Navigator.push(context, SlideRightRoute(page: Notifications()));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.03,
              ),
              _jobsComponents.getSelectViewText(),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.only(left: AppSizes.width*0.03),
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: AppColors.yellow,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.yellow,
                  ),
                  tabs: [
                    Container(
                      width: AppSizes.width * 0.3,
                      // width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.045,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(05),
                      ),
                      child: Tab(
                        child: Text("Placed (${_myJobsProvider.onLoadCounts().result.placed})",),
                      ),
                    ),
                    Container(
                      width: AppSizes.width * 0.3,
                      // width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.045,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(05),
                      ),
                      child: Tab(
                        child: Text("Accepted (${_myJobsProvider.onLoadCounts().result.acceptedByTransporter})",),
                      ),
                    ),
                    Container(
                      width: AppSizes.width * 0.3,
                      // width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.045,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(05),
                      ),
                      child: Tab(
                        child: Text("In Process (${_myJobsProvider.onLoadCounts().result.acceptedByShipper})",),
                      ),
                    ),
                    Container(
                      width: AppSizes.width * 0.3,
                      // width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.045,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(05),
                      ),
                      child: Tab(
                        child: Text("Delivered (${_myJobsProvider.onLoadCounts().result.delivered})",),
                      ),
                    ),
                    Container(
                      width: AppSizes.width * 0.3,
                      // width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.045,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(05),
                      ),
                      child: Tab(
                        child: Text("Canceled (${_myJobsProvider.onLoadCounts().result.rejectedByShipper})",),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.height*0.015,
                //height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Placed(),
                    Accepted(),
                    InProcess(),
                    Dispatch(),
                    Cancelled(),
                  ],
                ),
              ),
            ],
          ):
          Center(
            child: Container(
              height: AppSizes.height * 0.15,
              // width: AppSizes.width,
              child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
            ),
          ),
      ),

    );
  }
}
