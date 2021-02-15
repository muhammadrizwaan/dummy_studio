import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/cancelled/cancelled.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/cancelled/cancelled_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/delivered/delivered.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/delivered/delivered_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_provider.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import '../../../../animations/slide_right.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';
import 'my_jobs_provider.dart';

class MyJobs extends StatefulWidget {

  @override
  _MyJobsState createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  MyJobsComponents _jobsComponents;
  MyJobsProvider _myJobsProvider;
  PlacedProvider _placedProvider;
  AcceptedProvider _acceptedProvider;
  InProcessProvider _inProcessProvider;
  CancelledProvider _cancelledProvider;
  DeliveredProvider _deliveredProvider;

  int count;

  @override
  void initState() {
    super.initState();
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    _myJobsProvider.init(context: context);
    _placedProvider = Provider.of<PlacedProvider>(context, listen: false);
    _acceptedProvider = Provider.of<AcceptedProvider>(context, listen: false);
    _inProcessProvider = Provider.of<InProcessProvider>(context, listen: false);
    _cancelledProvider = Provider.of<CancelledProvider>(context, listen: false);
    _deliveredProvider = Provider.of<DeliveredProvider>(context, listen: false);
    count = 0;
    _jobsComponents = MyJobsComponents();
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<MyJobsProvider>(context, listen: true);
    Provider.of<PlacedProvider>(context, listen: true);
    Provider.of<AcceptedProvider>(context, listen: true);
    Provider.of<InProcessProvider>(context, listen: true);
    Provider.of<CancelledProvider>(context, listen: true);
    Provider.of<DeliveredProvider>(context, listen: true);
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
                    _jobsComponents.getTab(
                        text: Strings.placedText,
                        count: _myJobsProvider.placedCount
                      // count: 0
                    ),
                    _jobsComponents.getTab(
                        text: Strings.acceptedText,
                        count: _myJobsProvider.acceptedCount
                      // count: 0
                    ),
                    _jobsComponents.getTab(
                        text: Strings.inProcessText,
                        count: _myJobsProvider.inProcessCount
                      // count: 0
                    ),
                    _jobsComponents.getTab(
                        text: Strings.deliveredText,
                        count: _myJobsProvider.deliveredCount
                      // count: 0
                    ),
                    _jobsComponents.getTab(
                        text: Strings.cancelledText,
                        count: _myJobsProvider.cancelledCount
                      // count: 0
                    )
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
                    Delivered(),
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
