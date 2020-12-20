import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';


class Placed extends StatefulWidget {
  @override
  _PlacedState createState() => _PlacedState();
}

class _PlacedState extends State<Placed> {
  PlacedComponents _placedComponents;
  PlacedProvider _placedProvider;
  CustomPopup _loader = CustomPopup();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placedComponents = PlacedComponents();
    _placedProvider = Provider.of<PlacedProvider>(context, listen: false);
    _placedProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PlacedProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child: _placedProvider.isDataFetched?
      ListView.builder(
        itemCount: _placedProvider.tabbarResponse.result.length,
          itemBuilder: (context, index){
          return Column(
            children: [
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _placedComponents.getJobContainer(
                jobDetail: _placedProvider.tabbarResponse.result[index].loadId.toString(),
                pickUpLocation: _placedProvider.tabbarResponse.result[index].pickupLocation,
                destinationLocation: _placedProvider.tabbarResponse.result[index].dropoffLocation,
                startDate: _placedProvider.tabbarResponse.result[index].pickupDate,
                time: _placedProvider.tabbarResponse.result[index].pickupTime,
                status: _placedProvider.tabbarResponse.result[index].status,
                vehicleType: _placedProvider.tabbarResponse.result[index].vehicleTypeName,
                price: "${Strings.aed} ${_placedProvider.tabbarResponse.result[index].shipperCost.round()}",
                onAlert: () {
                  ApplicationToast.onDescriptionAlert(context: context, description: _placedProvider.tabbarResponse.result[index].vehicleTypeDescription);
                },
                onTap: () {
                  Navigator.push(context, SlideRightRoute(page: JobDetails(status:"Placed", loadId: _placedProvider.tabbarResponse.result[index].loadId)));
                },
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
            ],
          );
          }
      ):
      Center(
        child: Container(
          height: AppSizes.height * 0.15,
          // width: AppSizes.width,
          child: Lottie.asset(Assets.apiLoading, fit: BoxFit.cover),
        ),
      ),
    );
  }

}
