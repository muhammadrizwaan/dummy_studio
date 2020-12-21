import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process_provider.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';

class InProcess extends StatefulWidget {
  @override
  _InProcessState createState() => _InProcessState();
}

class _InProcessState extends State<InProcess> {
  InProcessComponents _inProcessComponents;
  InProcessProvider _inProcessProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inProcessComponents = InProcessComponents();
    _inProcessProvider = Provider.of<InProcessProvider>(context, listen: false);
    _inProcessProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<InProcessProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: _inProcessProvider.isDataFetched?
          ListView.builder(
            itemCount: _inProcessProvider.tabbarResponse.result.length,
              itemBuilder: (context, index){
            return Column(
              children: [
                SizedBox(
                  height: AppSizes.height * 0.02,
                ),
                _inProcessComponents.getJobContainer(
                  context: context,
                  jobDetail: _inProcessProvider.tabbarResponse.result[index].loadId.toString(),
                  pickUpLocation: _inProcessProvider.tabbarResponse.result[index].pickupLocation,
                  destinationLocation: _inProcessProvider.tabbarResponse.result[index].dropoffLocation,
                  startDate: _inProcessProvider.tabbarResponse.result[index].pickupDate,
                  time: _inProcessProvider.tabbarResponse.result[index].pickupTime,
                  status: _inProcessProvider.tabbarResponse.result[index].status,
                  vehicleType: _inProcessProvider.tabbarResponse.result[index].vehicleTypeName,
                  price: "${Strings.aed} ${_inProcessProvider.tabbarResponse.result[index].shipperCost.round()}",
                  onAlert: (){
                    ApplicationToast.onDescriptionAlert(context: context, description: _inProcessProvider.tabbarResponse.result[index].vehicleTypeDescription);
                  },
                  onTap: (){
                    Navigator.push(context, SlideRightRoute(page: JobDetails(status:"InProcess", loadId: _inProcessProvider.tabbarResponse.result[index].loadId)));
                  },
                  onDriverDetail: () {
                    Navigator.push(context, SlideRightRoute(page: DriverDetailScreen(driverId:_inProcessProvider.tabbarResponse.result[index].assignedDriverId)));
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
          child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
        ),
      )
    );
  }
}
