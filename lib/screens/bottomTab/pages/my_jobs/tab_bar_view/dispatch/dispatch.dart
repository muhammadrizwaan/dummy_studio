import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch_provider.dart';
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
  DispatchedProvider _dispatchedProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dispatchComponents = DispatchComponents();
    _dispatchedProvider = Provider.of<DispatchedProvider>(context, listen: false);
    _dispatchedProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DispatchedProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: _dispatchedProvider.isDataFetched
          ? ListView.builder(
              itemCount: _dispatchedProvider.tabbarResponse.result.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    _dispatchComponents.getJobContainer(
                      jobDetail: _dispatchedProvider
                          .tabbarResponse.result[index].loadId
                          .toString(),
                      pickUpLocation: _dispatchedProvider
                          .tabbarResponse.result[index].pickupLocation,
                      destinationLocation: _dispatchedProvider
                          .tabbarResponse.result[index].dropoffLocation,
                      startDate: _dispatchedProvider
                          .tabbarResponse.result[index].pickupDate,
                      time: _dispatchedProvider
                          .tabbarResponse.result[index].pickupTime,
                      status: _dispatchedProvider
                          .tabbarResponse.result[index].status,
                      vehicleType: _dispatchedProvider
                          .tabbarResponse.result[index].vehicleTypeName,
                      price:
                          "${Strings.aed} ${_dispatchedProvider.tabbarResponse.result[index].shipperCost.round()}",
                      onAlert: () {
                        ApplicationToast.onDescriptionAlert(
                            context: context,
                            description: _dispatchedProvider.tabbarResponse
                                .result[index].vehicleTypeDescription);
                      },
                      onTap: () {
                        Navigator.push(
                            context, SlideRightRoute(page: JobDetails()));
                      },
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                  ],
                );
              })
          : Center(
              child: Container(
                height: AppSizes.height * 0.15,
                // width: AppSizes.width,
                child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
              ),
            ),
    );
  }
}
