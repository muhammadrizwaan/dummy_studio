import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/cancelled/cancelled_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';
import 'cancelled_components.dart';

class Cancelled extends StatefulWidget {
  @override
  _CancelledState createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
  CancelledComponents _cancelledComponents;
  CancelledProvider _cancelledProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cancelledComponents = CancelledComponents();
    _cancelledProvider = Provider.of<CancelledProvider>(context, listen: false);
    _cancelledProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CancelledProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: _cancelledProvider.isDataFetched ?
          _cancelledProvider.tabbarResponse.result.length > 0?
          ListView.builder(
              itemCount: _cancelledProvider.tabbarResponse.result.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    _cancelledComponents.getJobContainer(
                      jobDetail: _cancelledProvider.tabbarResponse.result[index].loadId.toString(),
                      pickUpLocation: _cancelledProvider.tabbarResponse.result[index].pickupLocation,
                      destinationLocation: _cancelledProvider.tabbarResponse.result[index].dropoffLocation,
                      startDate: _cancelledProvider.tabbarResponse.result[index].pickupDateTime,
                      time: "",
                      status: _cancelledProvider.tabbarResponse.result[index].status,
                      vehicleType: _cancelledProvider.tabbarResponse.result[index].vehicleTypeName,
                      price: "${Strings.aed} ${_cancelledProvider.tabbarResponse.result[index].shipperCost.round()}",
                      onAlert: () {
                        ApplicationToast.onDescriptionAlert(context: context, description: _cancelledProvider.tabbarResponse.result[index].vehicleTypeDescription);
                      },
                      onTap: () {
                        Navigator.push(
                            context, SlideRightRoute(page: JobDetails(status:"InProcess", loadId: _cancelledProvider.tabbarResponse.result[index].loadId)));
                      },
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                  ],
                );
              }):
          Center(
            child: Container(
                height: AppSizes.height * 0.15,
                // width: AppSizes.width,
                child: CommonWidgets.onNullData(text: "No Cancelled Loads")
            ),
          )
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
