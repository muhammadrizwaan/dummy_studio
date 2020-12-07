import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import '../../../../animations/slide_right.dart';
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
  int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
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
                    ? FontAwesome5.bell
                    : Linecons.wallet,
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
              Container(
                padding: EdgeInsets.only(left: AppSizes.width*0.03),
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: AppColors.yellow,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.yellow,
                  ),
                  tabs: [
                    Container(
                      width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.055,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(08),
                      ),
                      child: Tab(
                        child: Text("Placed",),
                      ),
                    ),
                    Container(
                      width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.055,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(08),
                      ),
                      child: Tab(
                        child: Text("Accepted",),
                      ),
                    ),
                    Container(
                      width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.055,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(08),
                      ),
                      child: Tab(
                        child: Text("In Process",),
                      ),
                    ),
                    Container(
                      width: AppSizes.width * 0.25,
                      height: AppSizes.height*0.055,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(08),
                      ),
                      child: Tab(
                        child: Text("Dispatched",),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Placed(),
                    Accepted(),
                    InProcess(),
                    Dispatch(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
