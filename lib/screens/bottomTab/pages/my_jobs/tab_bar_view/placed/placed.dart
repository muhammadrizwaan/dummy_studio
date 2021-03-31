import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/my_jobs_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_components.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/common_widgets.dart';


class Placed extends StatefulWidget {
  @override
  _PlacedState createState() => _PlacedState();
}

class _PlacedState extends State<Placed> {
  PlacedComponents _placedComponents;
  PlacedProvider _placedProvider;
  MyJobsProvider _myJobsProvider;
  ScrollController _scrollController = new ScrollController();
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    pageNumber = 0;
    _placedComponents = PlacedComponents();
    _placedProvider = Provider.of<PlacedProvider>(context, listen: false);
    _placedProvider.init(context: context);
    _myJobsProvider = Provider.of<MyJobsProvider>(context, listen: false);
    _scrollController
      ..addListener(() {
        if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
          pageNumber = pageNumber + 1;
          _placedProvider.setIsLoading(true);
          setState(() {});
          _placedProvider.getPlacedLoad(context: context, pageNumber: pageNumber);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PlacedProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05),
      color: Colors.white,
      child:
          Column(
            children: [
              Expanded(
                child:RefreshIndicator(
                  color: AppColors.yellow,
                  onRefresh: () => onRefresh(),
                    child: _myJobsProvider.placedList.length > 0?
                    ListView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _myJobsProvider.placedList.length,
                  itemBuilder: (context, index){
                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _placedComponents.getJobContainer(
                        jobDetail: _myJobsProvider.placedList[index].loadId.toString(),
                        pickUpLocation: _myJobsProvider.placedList[index].pickupLocation,
                        destinationLocation: _myJobsProvider.placedList[index].dropoffLocation,
                        startDate: _myJobsProvider.placedList[index].pickupDateTime,
                        time: _myJobsProvider.placedList[index].pickupDateTime,
                        status: _myJobsProvider.placedList[index].status,
                        vehicleType: _myJobsProvider.placedList[index].vehicleTypeName,
                        vehicleCategory: _myJobsProvider.placedList[index].vehicleCategoryName,
                        price: "${Strings.aed} ${_myJobsProvider.placedList[index].shipperCost}",
                        onVehicleType: () {
                          ApplicationToast.onDescriptionAlert(context: context, description: _myJobsProvider.placedList[index].vehicleTypeDescription);
                        },
                        onLoadDetail: () {
                          Navigator.push(context, SlideRightRoute(page: JobDetails(status:"Placed", loadId: _myJobsProvider.placedList[index].loadId)));
                        },
                        onVehicleCategory: (){
                          ApplicationToast.onDescriptionAlert(context: context, description: _myJobsProvider.placedList[index].vehicleCategoryDescription);
                        }
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                    ],
                  );
                  }
                ):ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.height * 0.3),
                            child: CommonWidgets.onNullData(text: Strings.noAvailableLoads)
                        ),
                      ],
                    )
              )
              ),
              _placedProvider.isLoading?
              Container(
                height:  AppSizes.height * 0.1,
                color: Colors.transparent,
                child: Center(
                  child: new CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(AppColors.yellow),
                  ),
                ),
              ):
              Container(),
            ],
          )
    );
  }
  Future<Null> onRefresh() async{
    pageNumber = 0;
    await _myJobsProvider.getLoads(context: context);
  }

}
