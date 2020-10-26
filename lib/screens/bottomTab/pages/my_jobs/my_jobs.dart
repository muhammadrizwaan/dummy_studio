
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_components.dart';

import '../../../../animations/slide_right.dart';
import '../../../../res/assets.dart';
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
    return Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.tabsAppBar1(
              text: "My Jobs",
              iconName: widget.tag == Strings.indiviual ? Assets.bellIconUnpress : Assets.walletIcon,
              onPress: () {
                // Navigator.push(context, SlideRightRoute(page: Wallet()));
                Navigator.push(context, SlideRightRoute(page: Wallet()));
              },
            ),
            Divider(
              height: 10,
            ),
            SizedBox(
              height: AppSizes.height * 0.03,
            ),
            _jobsComponents.getSelectViewText(),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
              child: Row(
                children: [
                  _jobsComponents.onSelectViewType(
                      text: "Active",
                      onPress: () {
                        // Navigator.push(
                        //     context, SlideRightRoute(page: LoadDetail()));
                      }),
                  SizedBox(
                    width: AppSizes.width * 0.02,
                  ),
                  _jobsComponents.onSelectViewType(
                      text: "In Processing", onPress: () {}),
                  SizedBox(
                    width: AppSizes.width * 0.02,
                  ),
                  _jobsComponents.onSelectViewType(
                      text: "Completed", onPress: () {}),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.width * 0.05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _jobsComponents.getJobContainer(
                            jobDetail: "01",
                            pickUpLocation: "ABC Port:",
                            destinationLocation: "227 Building, UAE:",
                            startDate: "11 Aug,",
                            time: '12:00am',
                            status: "Active",
                            onTap: () {}),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _jobsComponents.getJobContainer(
                            jobDetail: "01",
                            pickUpLocation: "ABC Port:",
                            destinationLocation: "227 Building, UAE:",
                            startDate: "11 Aug,",
                            time: '12:00am',
                            status: "Active",
                            onTap: () {}),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _jobsComponents.getJobContainer(
                            jobDetail: "01",
                            pickUpLocation: "ABC Port:",
                            destinationLocation: "227 Building, UAE:",
                            startDate: "11 Aug,",
                            time: '12:00am',
                            status: "Active",
                            onTap: () {}),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                        _jobsComponents.getJobContainer(
                            jobDetail: "01",
                            pickUpLocation: "ABC Port:",
                            destinationLocation: "227 Building, UAE:",
                            startDate: "11 Aug,",
                            time: '12:00am',
                            status: "Active",
                            onTap: () {}),
                        SizedBox(
                          height: AppSizes.height * 0.02,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
